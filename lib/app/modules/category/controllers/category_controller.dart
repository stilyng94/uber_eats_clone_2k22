import 'package:get/get.dart';

import '../category_model.dart';
import '../providers/category_provider.dart';

class CategoryController extends GetxController {
  final CategoryProvider _categoryProvider;

  final categories = RxList<Category>();

  CategoryController(this._categoryProvider);

  @override
  void onReady() {
    super.onReady();
    getCategories();
  }

  @override
  void onClose() {}

  Future<void> getCategories() async {
    var response = await _categoryProvider.getCategories();
    categories.value = response;
    return;
  }
}
