import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../places_prediction_model.dart';

class PlacesPredictionProvider extends GetConnect {
  final String _apiKey = dotenv.env['FSQ_DEVELOPER_API_KEY'] ?? "";

  Future<PlacesPrediction?> getPlacesPrediction(
      String searchQuery, String longLat) async {
    final response = await get('https://api.foursquare.com/v3/places/search',
        query: {"query": searchQuery, "ll": longLat},
        headers: {"Authorization": _apiKey});

    return PlacesPrediction.fromJson(response.body);
  }

  Future<Response> getPlaceDetail(int id) async =>
      await get('https://api.foursquare.com/v3/places/$id',
          headers: {"Authorization": _apiKey});
}
