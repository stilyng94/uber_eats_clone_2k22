import 'package:flutter/material.dart';

import 'package:emojis/emojis.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/asset_constants.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../cart/views/cart_view.dart';
import '../../restaurant/controllers/restaurant_controller.dart';
import '../../restaurant/restaurant_model.dart';
import '../food_model.dart';
import './food_info_view.dart';

class RestaurantDetailView extends StatefulWidget {
  const RestaurantDetailView({Key? key, required this.business})
      : super(key: key);
  final Business business;

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  final RestaurantController restaurantController =
      Get.find<RestaurantController>();
  final CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    // restaurantController.getRestaurant(widget.business.id!);
  }

  String formatDescription() {
    var formattedCategories =
        widget.business.categories!.map((e) => e.title).join(" - ");
    var description =
        "$formattedCategories ${widget.business.price != null ? ' * ${widget.business.price}' : ''} * ${Emojis.fire} * ${widget.business.rating} ${Emojis.star} (${widget.business.reviewCount}+)";
    return description;
  }

  final items = [
    FoodModel(id: "1", price: 10.99, title: "wheat"),
    FoodModel(id: "12", price: 9.99, title: "wheat"),
    FoodModel(id: "123", price: 8.99, title: "wheat"),
    FoodModel(id: "12345", price: 7.99, title: "wheat"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverSafeArea(
            top: false,
            sliver: SliverAppBar(
              pinned: true,
              expandedHeight: 300.0,
              stretch: true,
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.business.id!,
                      child: Image.network(
                        widget.business.imageUrl!,
                        fit: BoxFit.cover,
                        height: 220,
                        width: Get.size.width,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                widget.business.name!,
                                style: const TextStyle(
                                    fontSize: 29, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                formatDescription(),
                                style: const TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        FoodInfoView(
                          foodModel: items[index],
                        ),
                        index > 1 || index == 0 && index < items.length - 1
                            ? const Divider(
                                color: Colors.blueGrey,
                                thickness: 0.1,
                              )
                            : Container()
                      ],
                    );
                  },
                  childCount: items.length,
                ),
              ),
              padding: const EdgeInsets.all(12.0),
            )
          ],
        ),
      ),
      Obx(() {
        return cartController.cart.value.items.isNotEmpty &&
                !cartController.loading.value
            ? const Positioned(
                bottom: 50,
                height: 80,
                right: 50,
                left: 50,
                child: CartView(),
              )
            : Container();
      }),
      Obx(() {
        return cartController.loading.value
            ? Align(
                alignment: Alignment.center,
                child: LottieBuilder.asset(
                  "${AssetConstants.animationsPath}/scanner.json",
                  height: 200,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              )
            : Container();
      }),
      Obx(() {
        return cartController.loading.value
            ? const ModalBarrier(
                dismissible: false,
                semanticsLabel: "loading",
                color: Colors.black38,
              )
            : Container();
      }),
    ]));
  }
}
