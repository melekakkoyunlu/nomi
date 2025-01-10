import 'package:latlong2/latlong.dart';

class Place {
  final String id;
  final String name;
  final LatLng location;

  Place({required this.id, required this.name, required this.location});

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    return Place(
      id: json['place_id'],
      name: json['name'],
      location: LatLng(location['lat'], location['lng']),
    );
  }
}
