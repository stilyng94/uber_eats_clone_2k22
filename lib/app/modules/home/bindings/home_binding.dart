import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../category/controllers/category_controller.dart';
import '../../category/providers/category_provider.dart';
import '../../order/providers/order_provider.dart';
import '../../restaurant/controllers/restaurant_controller.dart';
import '../../restaurant/providers/restaurant_provider.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(CategoryProvider()),
    );
    Get.lazyPut<RestaurantController>(
      () => RestaurantController(
          RestaurantProvider(), Get.find<HomeController>()),
    );
    Get.put<CartController>(CartController(DevOrderProvider()));
  }
}
