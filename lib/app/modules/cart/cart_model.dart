import '../restaurantDetail/food_model.dart';

class CartModel {
  List<FoodModel> items;
  String restaurant;
  double totalCost;

  CartModel(
      {this.items = const <FoodModel>[],
      this.totalCost = 0.00,
      required this.restaurant});
}
