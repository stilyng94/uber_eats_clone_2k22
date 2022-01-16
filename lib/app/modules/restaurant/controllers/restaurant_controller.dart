import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../providers/restaurant_provider.dart';
import '../restaurant_model.dart';

class RestaurantController extends GetxController {
  final RestaurantProvider _restaurantProvider;
  final HomeController _homeController;
  var restaurants = Rx(RestaurantModel());
  var locationName = "broklyn".obs;

  late Worker _worker;

  RestaurantController(this._restaurantProvider, this._homeController);

  @override
  void onInit() {
    _worker = everAll([locationName, _homeController.activeButton], (value) {
      switch (value.runtimeType) {
        case String:
          return getRestaurants(locationName: value);
        case HeaderButtonType:
          return getRestaurants(locationName: locationName.value);
      }
    }, condition: true);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getRestaurants();
  }

  @override
  void onClose() {
    _worker.dispose();
  }

  Future<void> getRestaurants(
      {String searchTerm = 'restaurant',
      String locationName = "broklyn"}) async {
    var data =
        await _restaurantProvider.getRestaurants(searchTerm, locationName);
    data.businesses?.retainWhere((element) => element.transactions!
        .contains(_homeController.activeButton.value.name.toLowerCase()));
    restaurants.value = data;
    return;
  }

  Future<void> getRestaurant(String restaurantId) async {
    await _restaurantProvider.getRestaurant(restaurantId);
    return;
  }
}
