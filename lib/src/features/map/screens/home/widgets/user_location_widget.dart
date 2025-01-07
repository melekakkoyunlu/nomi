import 'package:demo/src/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../common_widgets/map/map_widget.dart';
import '../../../services/places_service.dart';


class UserLocationWidget extends StatefulWidget {
  @override
  _UserLocationWidgetState createState() => _UserLocationWidgetState();
}

class _UserLocationWidgetState extends State<UserLocationWidget> {
  LatLng? _userLocation;
  bool _isLoading = false;
  List<Place> _nearbyPlaces = [];
  final PlacesService _placesService = PlacesService(GoogleMapsPlatformAPI);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          userLocation: _userLocation,
          nearbyPlaces: _nearbyPlaces,
        ),
        if (_isLoading)
          Center(child: CircularProgressIndicator()), // Loading spinner
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _getUserLocationAndPlaces,
            child: Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }

  Future<void> _getUserLocationAndPlaces() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch user location
      LatLng location = await _fetchUserLocation();

      // Fetch nearby places
      List<Place> places = await _placesService.fetchNearbyPlaces(location, 'restaurant');

      setState(() {
        _userLocation = location;
        _nearbyPlaces = places;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error fetching data: $e"),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<LatLng> _fetchUserLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // If location service is not enabled, return a default value or show an error
      throw Exception("Location services are disabled.");
    }

    // Request permission to access location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // If permission is denied, throw an error
        throw Exception("Location permission denied.");
      }
    }

    // Fetch the user's current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Convert the position into LatLng
    return LatLng(position.latitude, position.longitude);
  }

}
