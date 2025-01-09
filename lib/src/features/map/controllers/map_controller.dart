import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMapController {
  final MapController mapController = MapController();

  void moveToLocation(double latitude, double longitude, double zoom) {
    mapController.move(LatLng(latitude, longitude), zoom);
  }
}
