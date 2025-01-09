import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../common_widgets/map/map_widget.dart';
import '../../../../../constants/api.dart';
import '../../../controllers/map_controller.dart';
import '../../../services/places_service.dart';
import 'filter_buttons_widget.dart';

class UserLocationWidget extends StatefulWidget {
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
          mapController: _customMapController.mapController,
        ),
        if (_isLoading)
          Center(child: CircularProgressIndicator()),
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
            onPressed: () async {
              Map<String, dynamic>? filters = await showFilterPopup(context);
              if (filters != null) {
                double distance = filters["distance"];
                List<String> cuisines = filters["cuisines"];
                _applyFilters(distance, cuisines);
              }
            },
            child: Icon(Icons.filter_alt),
          ),
        ),
      ],
    );
  }

  Future<void> _applyFilters(double distance, List<String> cuisines) async {
    if (_userLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User location is not available.")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Yakındaki yerleri filtrele
      List<Place> filteredPlaces = await _placesService.fetchNearbyPlaces(
        _userLocation!,
        'restaurant',
        distance: distance,
        cuisines: cuisines,
      );

      setState(() {
        _nearbyPlaces = filteredPlaces;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching filtered data: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
