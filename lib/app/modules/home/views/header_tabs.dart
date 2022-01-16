import 'package:flutter/material.dart';

import 'package:uber_eats_clone_2k22/app/modules/home/views/header_button.dart';

import '../controllers/home_controller.dart';

class HeaderTabs extends StatelessWidget {
  const HeaderTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderButton(
            key: Key(HeaderButtonType.delivery.name),
            headerButtonType: HeaderButtonType.delivery,
            buttonText: "delivery"),
        HeaderButton(
            key: Key(HeaderButtonType.pickup.name),
            headerButtonType: HeaderButtonType.pickup,
            buttonText: "pickup")
      ],
    );
  }
}
