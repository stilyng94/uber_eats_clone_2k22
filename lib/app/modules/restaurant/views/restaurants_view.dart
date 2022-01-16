import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/restaurant_controller.dart';
import '../views/restaurant_view.dart';

class RestaurantsView extends StatelessWidget {
  RestaurantsView({Key? key}) : super(key: key);

  final RestaurantController restaurantController =
      Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:
              restaurantController.restaurants.value.businesses?.length ?? 0,
          shrinkWrap: true,
          primary: true,
          itemBuilder: (context, index) {
            final restaurant =
                restaurantController.restaurants.value.businesses![index];
            return RestaurantView(business: restaurant);
          });
    });
  }
}
