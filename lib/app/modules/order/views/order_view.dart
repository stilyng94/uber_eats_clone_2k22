import 'package:flutter/material.dart';

import 'package:emojis/emojis.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/asset_constants.dart';
import '../../order/model/order_model.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView(this.orderModel, {Key? key}) : super(key: key);
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: Get.size.width,
        child: Column(
          children: [
            //Use checkmark animation
            LottieBuilder.asset(
              "${AssetConstants.animationsPath}/check-mark.json",
              height: 150,
              fit: BoxFit.cover,
              animate: true,
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              padding: const EdgeInsets.all(10),
              child: Text(
                "Your order at ${orderModel.restaurant} has been placed for ${Emojis.rocket}${Emojis.rocket} \$${orderModel.price}",
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            //Cooking animation
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: LottieBuilder.asset(
                "${AssetConstants.animationsPath}/cooking.json",
                height: 200,
                fit: BoxFit.cover,
                animate: true,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
