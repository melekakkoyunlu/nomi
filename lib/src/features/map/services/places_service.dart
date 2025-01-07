import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  Future<List<Place>> fetchNearbyPlaces(LatLng location, String type) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
        '?location=${location.latitude},${location.longitude}'
        '&radius=1500' // Search radius in meters
        '&type=$type' // Type of place (e.g., restaurant, cafe)
        '&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((place) => Place.fromJson(place))
          .toList();
    } else {
      throw Exception('Failed to fetch places');
    }
  }
}

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
