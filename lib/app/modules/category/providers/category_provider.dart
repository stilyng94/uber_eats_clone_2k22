import '../../../constants/asset_constants.dart';
import '../category_model.dart';

class CategoryProvider {
  Future<List<Category>> getCategories() async {
    var categories = [
      Category(
          id: "1",
          imageUrl: "${AssetConstants.imagePath}/bread.png",
          name: "Bakery"),
      Category(
          id: "2",
          imageUrl: "${AssetConstants.imagePath}/coffee.png",
          name: "Coffee & Tea"),
      Category(
          id: "1",
          imageUrl: "${AssetConstants.imagePath}/deals.png",
          name: "Deals"),
      Category(
          id: "3",
          imageUrl: "${AssetConstants.imagePath}/desserts.png",
          name: "Desserts"),
      Category(
          id: "4",
          imageUrl: "${AssetConstants.imagePath}/fast-food.png",
          name: "Fast Foods"),
      Category(
          id: "5",
          imageUrl: "${AssetConstants.imagePath}/shopping-bag.png",
          name: "Pick-up"),
      Category(
          id: "6",
          imageUrl: "${AssetConstants.imagePath}/soft-drink.png",
          name: "Soda"),
    ];

    return Future.delayed(const Duration(milliseconds: 500), () => categories);
  }
}
