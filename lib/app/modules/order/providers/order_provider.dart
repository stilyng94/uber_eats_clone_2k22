import 'dart:math';

import '../../cart/cart_model.dart';
import '../model/order_model.dart';
import '../providers/iorder_provider.dart';

class DevOrderProvider extends IOrderProvider {
  @override
  Future<OrderModel> createOrder(CartModel cartModel) async {
    var randomId = Random.secure().nextDouble().toString();
    var order = OrderModel(
        id: randomId,
        items: cartModel.items,
        restaurant: cartModel.restaurant,
        price: cartModel.totalCost);
    return Future.delayed(const Duration(milliseconds: 5000), () => order);
  }

  @override
  Future<OrderModel> getOrder(String orderId) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }
}
