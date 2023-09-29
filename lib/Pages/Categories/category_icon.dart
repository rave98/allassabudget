import 'dart:math';

import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String categoryName;

  CategoryIcon(this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.primaries[Random(categoryName.hashCode).nextInt(Colors.primaries.length)]
          ),
        ),
        Text(categoryName)
      ],
    );
  }
}
