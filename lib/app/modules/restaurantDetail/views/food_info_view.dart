import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../food_model.dart';

class FoodInfoView extends StatelessWidget {
  FoodInfoView({
    Key? key,
    required this.foodModel,
  }) : super(key: key);
  final FoodModel foodModel;

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.size.width,
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Checkbox(
                  value: (cartController.cart.value.items.firstWhereOrNull(
                          (element) => element.id == foodModel.id)) !=
                      null,
                  onChanged: (flag) {
                    cartController.loading.value
                        ? null
                        : cartController.addToCart(
                            foodModel, "restaurant", flag!);
                  });
            }),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lasagna",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Beef salad with abokyi Beef salad with abokyi  ",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 15.5, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "\$ 19.5",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 15.5, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Container(
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://s3-media3.fl.yelpcdn.com/bphoto/aViDtyaJ5YRmsqC4ot5L2w/o.jpg",
                      )),
                  // shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            )
          ],
        ));
  }
}
