import '../../cart/cart_model.dart';
import '../model/order_model.dart';

abstract class IOrderProvider {
  Future<OrderModel> createOrder(CartModel cartModel);
  Future<OrderModel> getOrder(String orderId);
}
