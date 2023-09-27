import 'package:allassabudget/Storage/Models/expense.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';


class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Storage.localStorage!.expenses.where().findAll(), 
      builder: (BuildContext context, AsyncSnapshot<List<Expense>> snapshot) {
        if(snapshot.hasData) {
          return GridView.count(crossAxisCount: 5, children: snapshot.data!.map((e) => Text(e.categories.first)).toList(),);
        } else if (snapshot.hasError) {
          return Center(child: Text("We had a problem retrieving your categories"),);
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}
