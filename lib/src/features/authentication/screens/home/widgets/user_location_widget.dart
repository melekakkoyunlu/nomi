import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../common_widgets/map/map_widget.dart';
import 'location_service.dart';

class UserLocationWidget extends StatefulWidget {
  @override
  _UserLocationWidgetState createState() => _UserLocationWidgetState();
}

class _UserLocationWidgetState extends State<UserLocationWidget> {
  LatLng? _userLocation;
  bool _isLoading = false;
  final LocationService _locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(userLocation: _userLocation),
        if (_isLoading)
          Center(child: CircularProgressIndicator()), // Loading spinner
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _getUserLocation,
            child: Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }

  Future<void> _getUserLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      LatLng? location = await _locationService.getCurrentLocation();
      if (location != null) {
        setState(() {
          _userLocation = location;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Unable to fetch location."),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error fetching location: $e"),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}