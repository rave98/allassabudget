import 'package:allassabudget/Pages/Categories/categories_grid.dart';
import 'package:allassabudget/Storage/Models/category.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:allassabudget/logger.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () => showModalBottomSheet(context: context, builder: (context) {
              TextEditingController categoryName = TextEditingController();
              return Column(children: [
                Text("Name", style: Theme.of(context).textTheme.titleMedium,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(controller: categoryName,)),
                MaterialButton(
                  onPressed: () async {
                    logger.info("Saving new category ${categoryName.text}");
                    await Storage.addCategory(Category(name: categoryName.text));
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: const Text("Add new category"))
                ],
              );
          }),
          child: Icon(Icons.add_circle, color: Theme.of(context).primaryColor, size: 300,),),
        CategoriesGrid(),
      ],
    );
  }
}
