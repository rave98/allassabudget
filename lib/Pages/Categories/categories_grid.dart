import 'package:allassabudget/Pages/Categories/category_icon.dart';
import 'package:allassabudget/Storage/Models/category.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});

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
              children: snapshot.data!.map((category) => CategoryIcon(category.name)).toList(),) :
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
