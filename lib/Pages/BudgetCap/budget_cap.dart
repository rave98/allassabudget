import 'package:allassabudget/Pages/AddExpenseManually/categories_grid_selectable.dart';
import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:allassabudget/utils.dart';

class BudgetCap extends StatelessWidget {
  BudgetCap({super.key});
  final CategoriesSelectingController categoriesController = CategoriesSelectingController();
  final TextEditingController capController = TextEditingController();

  void confirmCapCategories(BuildContext context) {
    if (categoriesController.categoriesList.isEmpty) {
      return;
    }
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("${AppLocalizations.of(context)!.confirmCapCategories}: ${capController.text}"),
        content: Column(
          children: categoriesController
            .categoriesList.map((category) => Row(children: [
              Icon(Icons.circle, color: associatedColor(category.name),),
              Text(category.name)
            ],)).toList(),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(AppLocalizations.of(context)!.cancel)),
          ElevatedButton(onPressed: () async {
            for (var i = 0; i < categoriesController.categoriesList.length; i++) {
              categoriesController.categoriesList[i].cap = int.parse(capController.text) * 100;
              await Storage.addCategory(categoriesController.categoriesList[i]);
              Navigator.pop(context);
            }
          }, child: Text(AppLocalizations.of(context)!.confirm))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesGridSelectable(categoriesController),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: capController,
          decoration: InputDecoration(
            suffixIcon: Container(
              margin: const EdgeInsets.all(8),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => confirmCapCategories(context),
              ),
            ),
          ),
        ),
        ElevatedButton(onPressed: () => confirmCapCategories(context), child: Text(AppLocalizations.of(context)!.addExpense))
      ]);
  }
}
