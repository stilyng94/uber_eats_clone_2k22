import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../../constants/url_constants.dart';
import '../restaurant_model.dart';

class RestaurantProvider extends GetConnect {
  final String _apiKey = dotenv.env['YELP_API_KEY'] ?? "";

  Future<RestaurantModel> getRestaurants(
      String searchTerm, String locationName) async {
    final response = await get(UrlConstants.yelpApi,
        query: {"term": searchTerm, "location": locationName},
        headers: {"Authorization": "Bearer $_apiKey"});
    return RestaurantModel.fromJson(response.body);
  }

  Future<RestaurantModel> getRestaurant(String restaurantId) async {
    final response = await get("${UrlConstants.yelpApi}/$restaurantId",
        headers: {"Authorization": "Bearer $_apiKey"});
    return RestaurantModel.fromJson(response.body);
  }
}
