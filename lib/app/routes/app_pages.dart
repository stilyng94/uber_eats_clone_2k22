import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/model/order_model.dart';
import '../modules/order/views/order_view.dart';
import '../modules/restaurant/restaurant_model.dart';
import '../modules/restaurantDetail/views/restaurant_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESTUARANT_DETAIL,
      page: () {
        final typedArgs = Get.arguments as RestaurantDetailViewArguments;
        return RestaurantDetailView(
          business: typedArgs.business,
        );
      },
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () {
        final typedArgs = Get.arguments as OrderViewArguments;
        return OrderView(typedArgs.orderModel);
      },
      binding: OrderBinding(),
    ),
  ];
}

class RestaurantDetailViewArguments {
  final Key? key;
  final Business business;
  RestaurantDetailViewArguments({this.key, required this.business});
}

class OrderViewArguments {
  final Key? key;
  final OrderModel orderModel;
  OrderViewArguments({this.key, required this.orderModel});
}
