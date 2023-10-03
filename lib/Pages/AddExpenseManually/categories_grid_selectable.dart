import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:allassabudget/Storage/Models/category.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:allassabudget/logger.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'dart:math';

class CategoriesGridSelectable extends StatefulWidget {
  CategoiesSelectingController controller;
  
  CategoriesGridSelectable(this.controller, {super.key});

  @override
  State<CategoriesGridSelectable> createState() => _CategoriesGridSelectableState();
}

class _CategoriesGridSelectableState extends State<CategoriesGridSelectable> {

  _CategoriesGridSelectableState();

  Color associatedColor(String name) {
    return Colors.primaries[Random(name.hashCode).nextInt(Colors.primaries.length)];
  }

  Widget createCategoryIcon(String categoryName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: associatedColor(categoryName)
          ),
          child: widget.controller.categoriesList.map((e) => e.name).contains(categoryName) ?
            Icon(Icons.check, color: Colors.white,) : null,
        ),
        Text(categoryName)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Storage.localStorage!.categorys.where().findAll(), 
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if(snapshot.hasData) {
          return snapshot.data!.isNotEmpty ? 
            GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true, // to avoid unbounded height expansion
              children: snapshot.data!.map((category) =>
                // InkWell to wrap the actual category pin in order to capture the tapping
                InkWell(
                  child: createCategoryIcon(category.name),
                  onTap: () {
                    logger.info("Selecting ${category.name}");
                    setState(() {
                      widget.controller.addCategory(category);
                    });
                  },
                )).toList(),) :
            const Center(child: Text("No categories found"),);
        } else if (snapshot.hasError) {
          return const Center(child: Text("We had a problem retrieving your categories"),);
        } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
