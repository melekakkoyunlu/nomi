import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  /// Fetches nearby places based on location, type, distance, and cuisines.
  Future<List<Place>> fetchNearbyPlaces(
      LatLng location,
      String type, {
        required double distance,
        List<String>? cuisines,
      }) async {

    final int radius = (distance * 1000).toInt();


    final String keyword = cuisines != null && cuisines.isNotEmpty
        ? cuisines.join('|') // Google Places API'de '|' ile ayrılır
        : '';


    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
        '?location=${location.latitude},${location.longitude}'
        '&radius=$radius'
        '&type=$type'
        '${keyword.isNotEmpty ? '&keyword=$keyword' : ''}'
        '&key=$apiKey';

    // HTTP GET request
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // error handlings
      if (data['status'] != 'OK') {
        throw Exception(data['error_message'] ?? 'No results found');
      }

      return (data['results'] as List)
          .map((place) => Place.fromJson(place))
          .toList();
    } else {
      throw Exception('Failed to fetch places. HTTP Status: ${response.statusCode}');
    }
  }
}

/// Yer modeli
class Place {
  final String name;
  final LatLng location;

  Place({required this.name, required this.location});

  /// JSON'dan Place modeline dönüştürme
  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    return Place(
      name: json['name'],
      location: LatLng(location['lat'], location['lng']),
    );
  }
}
