import 'package:latlong2/latlong.dart';

class Place {
  final String name;
  final LatLng location;

  Place({required this.name, required this.location});

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    return Place(
      name: json['name'],
      location: LatLng(location['lat'], location['lng']),
    );
  }
}
