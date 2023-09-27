import 'package:allassabudget/Pages/Categories/categories_grid.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () {}, 
          child: Icon(Icons.add_circle, color: Theme.of(context).primaryColor, size: 300,),),
        CategoriesGrid(),
      ],
    );
  }
}
