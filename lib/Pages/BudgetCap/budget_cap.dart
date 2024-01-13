import 'package:allassabudget/Pages/AddExpenseManually/categories_grid_selectable.dart';
import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetCap extends StatelessWidget {
  BudgetCap({super.key});
  final CategoriesSelectingController categoriesController = CategoriesSelectingController();

  void confirmCapCategories() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesGridSelectable(categoriesController),
        ElevatedButton(onPressed: confirmCapCategories, child: Text(AppLocalizations.of(context)!.addExpense))
      ]);
  }
}
