import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  final LatLng? userLocation;

  MapWidget({this.userLocation});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: userLocation ?? LatLng(41.1173290650204, 29.003773089746943),
        initialZoom: 11,
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
    if (userLocation != null) {
      markers.add(
        Marker(
          point: userLocation!,
          width: 60,
          height: 60,
          child: Icon(
            Icons.location_pin,
            size: 60,
            color: Colors.blue,
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
