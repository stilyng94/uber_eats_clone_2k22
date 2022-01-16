import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../restaurant_model.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({Key? key, required this.business}) : super(key: key);
  final Business business;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RESTUARANT_DETAIL,
            arguments: RestaurantDetailViewArguments(business: business));
      },
      child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 30),
          padding: const EdgeInsets.all(15.0),
          width: Get.size.width,
          child: Column(
            children: [
              SizedBox(
                height: 180,
                width: Get.size.width,
                child: AspectRatio(
                  aspectRatio: Get.size.aspectRatio,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Hero(
                        tag: business.id!,
                        child: Image.network(
                          business.imageUrl!,
                          fit: BoxFit.cover,
                          height: 180,
                          width: Get.size.width,
                        ),
                      ),
                      // Like Icon
                      IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: const Icon(Icons.favorite_outline_sharp),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          business.name!,
                          style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "30-45  min",
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Text(
                      "4.5",
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
