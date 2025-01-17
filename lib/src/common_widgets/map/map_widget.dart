import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../constants/api.dart';
import '../../features/map/controllers/map_controller.dart';
import '../../features/map/models/place.dart';
import 'package:demo/src/features/map/services/fetch_place_details_service.dart' as FetchService;
import 'package:demo/src/features/map/services/places_service.dart' as NearbyService;
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {
  final LatLng? userLocation;
  final List<Place> nearbyPlaces;
  final CustomMapController customMapController;
  final Function(Place) onAddToBookmarks; // added callback prmtr

  const MapWidget({
    required this.customMapController,
    required this.onAddToBookmarks, // Make it required
    this.userLocation,
    this.nearbyPlaces = const [],
    Key? key,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  void _showPlaceDetails(BuildContext context, Place place) async {
    final placesService = FetchService.PlacesService(GoogleMapsPlatformAPI);
    try {
      final details = await placesService.fetchPlaceDetails(place.id);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(details['name'] ?? place.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (details['formatted_address'] != null)
                Text('Address: ${details['formatted_address']}'),
              if (details['formatted_phone_number'] != null)
                Text('Phone: ${details['formatted_phone_number']}'),
              if (details['rating'] != null)
                Text('Rating: ${details['rating']}'),
              if (details['website'] != null)
                GestureDetector(
                  onTap: () => _openWebsite(details['website']),
                  child: Text(
                    'Visit Website',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.onAddToBookmarks(place); // use callback to add bookmark
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
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch place details')),
      );
    }
  }

  void _openWebsite(String url) async {
    // url launcher
    launch(url);
  }

  //app acildiginda fix konum
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
    //user konum
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
    //restaurant konum
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
              child: Icon(Icons.fastfood_outlined , size: 30, color: Colors.deepPurple),
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
