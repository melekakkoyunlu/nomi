import 'package:demo/src/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../common_widgets/map/map_widget.dart';
import '../../../controllers/map_controller.dart';
import '../../../models/place.dart';
import '../../../services/places_service.dart';

class UserLocationWidget extends StatefulWidget {
  final Function(Place) onAddToBookmarks; // Callback for adding bookmarks

  UserLocationWidget({required this.onAddToBookmarks});

  @override
  _UserLocationWidgetState createState() => _UserLocationWidgetState();
}

class _UserLocationWidgetState extends State<UserLocationWidget> {
  LatLng? _userLocation;
  bool _isLoading = false;
  List<Place> _nearbyPlaces = [];
  final PlacesService _placesService = PlacesService(GoogleMapsPlatformAPI);
  final CustomMapController _customMapController = CustomMapController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          userLocation: _userLocation,
          nearbyPlaces: _nearbyPlaces,
          customMapController: _customMapController,
          onAddToBookmarks: widget.onAddToBookmarks, // pass callback to mapWidget
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
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
            onPressed: _filterPlaces,
            child: Icon(Icons.filter_alt),
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

      _customMapController.moveToLocation(location.latitude, location.longitude, 14);

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
      throw Exception("Location services are disabled.");
    }

    // Request permission to access location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied. Please enable it from settings.");
    }

    // Fetch the user's current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return LatLng(position.latitude, position.longitude);
  }

  Future<void> _filterPlaces() async {
    // Placeholder for filtering logic
  }
}
