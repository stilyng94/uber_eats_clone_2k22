import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HeaderButton extends GetView<HomeController> {
  final String buttonText;
  final HeaderButtonType headerButtonType;

  const HeaderButton({
    Key? key,
    required this.headerButtonType,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextButton(
          onPressed: () => controller.onHeaderButtonHandler(headerButtonType),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: controller.activeButton.value == headerButtonType
                      ? Colors.white
                      : Colors.black)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  controller.activeButton.value == headerButtonType
                      ? Colors.black
                      : Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 16))),
          child: Text(buttonText, semanticsLabel: buttonText));
    });
  }
}
