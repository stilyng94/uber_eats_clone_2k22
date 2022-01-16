import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../category/views/categories_view.dart';
import '../../restaurant/views/restaurants_view.dart';
import '../bottom_navigations.dart';
import '../controllers/home_controller.dart';
import '../views/header_tabs.dart';
import '../views/search.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  static const bottomNavigationItems = [
    'Home',
    'browse',
    'grocery',
    'orders',
    'account'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const HeaderTabs(),
                    Search(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                child: CategoriesView(),
                width: double.infinity,
                height: 80,
              ),
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                child: RestaurantsView(),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: BottomNavigationItems.bottomNavigationItems,
          onTap: (index) {
            controller.bottomNavigationIndex.value = index;
          },
          currentIndex: controller.bottomNavigationIndex.value,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        );
      }),
    );
  }
}
