import 'package:get/get.dart';

import '../../order/model/order_model.dart';
import '../../order/providers/iorder_provider.dart';
import '../../restaurantDetail/food_model.dart';
import '../cart_model.dart';

class CartController extends GetxController {
  final cart = CartModel(restaurant: '').obs;
  final loading = false.obs;

  final IOrderProvider _iOrderProvider;

  CartController(this._iOrderProvider);

  @override
  void onClose() {}

  void addToCart(FoodModel item, String restaurant, bool checkState) {
    if (checkState) {
      var newItems = [...cart.value.items, item];
      cart.value.items = newItems;
      cart.value.restaurant = restaurant;
    } else {
      var oldCartItems = [...cart.value.items];
      oldCartItems.removeWhere((element) => element.id == item.id);
      cart.value.items = oldCartItems;
      cart.value.restaurant = restaurant;
    }
    cart.value.totalCost =
        cart.value.items.fold(0.00, (value, element) => value + element.price);
    cart.refresh();
  }

  Future<OrderModel> checkOut() async {
    loading.toggle();
    final order = await _iOrderProvider.createOrder(cart.value);
    loading.toggle();
    return order;
  }
}
