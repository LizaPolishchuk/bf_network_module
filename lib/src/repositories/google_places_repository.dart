import 'dart:convert';
import 'package:http/http.dart';
import 'package:bf_network_module/src/entities/place_entity.dart';

class GooglePlacesRepository {
  final client = Client();
  final sessionToken;
  static const String apiKey = 'AIzaSyAzC7ChfWAthZi0D3DDrFpJkUfZz-gWKSE';

  GooglePlacesRepository(this.sessionToken);

  Future<List<SuggestionPlace>> fetchPlaceSuggestions(String input, String locale) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&language=$locale&components=country:ua&key=$apiKey&sessiontoken=$sessionToken';

    final response = await client.get(Uri.parse(request));

    print("response: ${response.body}");

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        return result['predictions']
            .map<SuggestionPlace>((p) => SuggestionPlace(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=formatted_address,geometry&key=$apiKey&sessiontoken=$sessionToken';

    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final location = result['result']['geometry']['location'] as Map<String, dynamic>;
        final name = result['result']['formatted_address'] as String;

        print("getPlaceDetailFromId response: ${response.body}");

        final place = Place(name, location["lat"], location["lng"]);

        print("place: $place");
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch place by id');
    }
  }
}
