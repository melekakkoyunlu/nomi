import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  Future<Map<String, dynamic>> fetchPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['result'];
    } else {
      throw Exception('Failed to fetch place details');
    }
  }
}
