import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../features/map/controllers/map_controller.dart';
import '../../features/map/models/place.dart';

class MapWidget extends StatefulWidget {
  final LatLng? userLocation;
  final List<Place> nearbyPlaces;
  final CustomMapController customMapController;

  const MapWidget({
    required this.customMapController,
    this.userLocation,
    this.nearbyPlaces = const [],
    Key? key,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final List<Place> bookmarks = [];

  void _addBookmark(Place place) {
    if (!bookmarks.contains(place)) {
      setState(() {
        bookmarks.add(place);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${place.name} added to bookmarks')),
      );
    }
  }

  void _showPlaceDetails(BuildContext context, Place place) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(place.name),
        content: Text('Details about ${place.name} go here...'),
        actions: [
          TextButton(
            onPressed: () {
              _addBookmark(place);
              Navigator.pop(context);
            },
            child: const Text('Add to Bookmarks'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.customMapController.mapController,
      options: MapOptions(
        initialCenter:
        widget.userLocation ?? LatLng(41.1173290650204, 29.003773089746943),
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

    if (widget.userLocation != null) {
      markers.add(
        Marker(
          point: widget.userLocation!,
          width: 60,
          height: 60,
          child: Icon(Icons.my_location, size: 50, color: Colors.blue),
        ),
      );
    }

    for (var place in widget.nearbyPlaces) {
      markers.add(
        Marker(
          point: place.location,
          width: 60,
          height: 60,
          child: GestureDetector(
            onTap: () => _showPlaceDetails(context, place),
            child: Tooltip(
              message: place.name,
              child: Icon(Icons.restaurant, size: 50, color: Colors.red),
            ),
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
