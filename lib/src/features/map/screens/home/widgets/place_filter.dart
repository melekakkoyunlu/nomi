import 'package:latlong2/latlong.dart';

class Place {
  final String name;
  final String cuisine;
  final LatLng location;

  Place({required this.name, required this.cuisine, required this.location});
}

List<Place> filterPlaces({
  required List<Place> places,
  required LatLng userLocation,
  required List<String> selectedCuisines,
  required double selectedDistance,
}) {
  final Distance distance = Distance();

  return places.where((place) {
    final isWithinDistance = distance.as(LengthUnit.Meter, userLocation, place.location) <= selectedDistance;
    final matchesCuisine = selectedCuisines.isEmpty || selectedCuisines.contains(place.cuisine);

    return isWithinDistance && matchesCuisine;
  }).toList();
}
