import '../../restaurantDetail/food_model.dart';

class OrderModel {
  String id;
  List<FoodModel> items;
  String restaurant;
  double price;

  OrderModel(
      {required this.id,
      required this.items,
      required this.restaurant,
      required this.price});
}
