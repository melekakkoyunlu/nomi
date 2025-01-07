import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../features/map/services/places_service.dart';

class MapWidget extends StatelessWidget {
  final LatLng? userLocation;
  final List<Place> nearbyPlaces;

  MapWidget({this.userLocation, this.nearbyPlaces = const []});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: userLocation ?? LatLng(41.1173290650204, 29.003773089746943),
        initialZoom: 14,
        interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
      ),
      children: [
        _openStreetMapTileLayer,
        MarkerLayer(
          markers: _buildMarkers(),
        ),
      ],
    );
  }

  List<Marker> _buildMarkers() {
    List<Marker> markers = [];

    // Add user location marker
    if (userLocation != null) {
      markers.add(
        Marker(
          point: userLocation!,
          width: 60,
          height: 60,
          child: Icon(Icons.my_location, size: 50, color: Colors.blue),
        ),
      );
    }

    // Add nearby places markers
    for (var place in nearbyPlaces) {
      markers.add(
        Marker(
          point: place.location,
          width: 60,
          height: 60,
          child: Tooltip(
            message: place.name,
            child: Icon(Icons.restaurant, size: 50, color: Colors.red),
          ),
        ),
      );
    }

    return markers;
  }

  TileLayer get _openStreetMapTileLayer => TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  );
}
