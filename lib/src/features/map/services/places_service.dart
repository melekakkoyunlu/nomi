import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../models/place.dart';

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  Future<List<Place>> fetchNearbyPlaces(LatLng location, String type) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
        '?location=${location.latitude},${location.longitude}'
        '&radius=1500' // search radius (meters)
        '&type=$type' // type of places
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
