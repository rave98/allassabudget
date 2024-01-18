import 'package:allassabudget/Pages/AddExpenseManually/categories_grid_selectable.dart';
import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:allassabudget/utils.dart';

class BudgetCap extends StatelessWidget {
  BudgetCap({super.key});
  final CategoriesSelectingController categoriesController = CategoriesSelectingController();

  void confirmCapCategories(BuildContext context) {
    if (categoriesController.categoriesList.isEmpty) {
      return;
    }
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmCapCategories),
        content: Column(
          children: categoriesController
            .categoriesList.map((category) => Row(children: [
              Icon(Icons.circle, color: associatedColor(category.name),),
              Text(category.name)
            ],)).toList(),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(AppLocalizations.of(context)!.cancel)),
          ElevatedButton(onPressed: () {}, child: Text(AppLocalizations.of(context)!.confirm))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesGridSelectable(categoriesController),
        ElevatedButton(onPressed: () => confirmCapCategories(context), child: Text(AppLocalizations.of(context)!.addExpense))
      ]);
  }
}
