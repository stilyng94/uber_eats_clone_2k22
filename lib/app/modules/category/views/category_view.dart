import 'package:flutter/material.dart';

import '../category_model.dart';

class CategoryView extends StatelessWidget {
  final Category category;

  const CategoryView({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 80,
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              category.imageUrl,
              height: 50,
              width: 60,
              fit: BoxFit.contain,
            ),
            Text(
              category.name,
              style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
