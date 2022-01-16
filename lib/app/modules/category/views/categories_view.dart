import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../views/category_view.dart';

class CategoriesView extends StatelessWidget {
  final CategoryController categoryController = Get.find<CategoryController>();

  CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.categories.length,
          shrinkWrap: true,
          primary: true,
          itemBuilder: (context, index) => CategoryView(
                category: categoryController.categories[index],
              ));
    });
  }
}
