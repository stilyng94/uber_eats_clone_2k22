import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:uber_eats_clone_2k22/app/routes/app_pages.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        isDismissible: controller.loading.value ? false : true,
        builder: (context) => getBottomSheet(context),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "View Cart",
                textAlign: TextAlign.center,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.white),
              ),
            ),
            Text(
              "\$ ${controller.cart.value.totalCost}",
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
    ;
  }

  BottomSheet getBottomSheet(BuildContext context) => BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            height: 500.0,
            width: Get.size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.cart.value.restaurant,
                  style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 24,
                      ),
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.cart.value.items.length,
                  shrinkWrap: true,
                  primary: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  itemBuilder: (context, index) {
                    final food = controller.cart.value.items[index];
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            food.title,
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$ ${food.price}",
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontSize: 16,
                                ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$ ${controller.cart.value.totalCost}",
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 16,
                            ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () async {
                    //TODO: close modal. navigate to order page
                    Get.close(1);
                    final orders = await controller.checkOut();
                    Get.toNamed(Routes.ORDER,
                        arguments: OrderViewArguments(orderModel: orders));
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, 70)),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          DefaultTextStyle.of(context).style.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text("Checkout",
                                textAlign: TextAlign.center,
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(color: Colors.white))),
                        Text(
                          "\$ ${controller.cart.value.totalCost}",
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
}
