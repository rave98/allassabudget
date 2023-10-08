import 'package:allassabudget/Pages/AddExpenseManually/categories_grid_selectable.dart';
import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:allassabudget/utils.dart';
import 'package:flutter/material.dart';

class AddExpenseManually extends StatefulWidget {
  AddExpenseManually({super.key});

  @override
  State<AddExpenseManually> createState() => _AddExpenseManuallyState();
}

class _AddExpenseManuallyState extends State<AddExpenseManually> {
  final TextEditingController inOutController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final CategoiesSelectingController categoriesController = CategoiesSelectingController();

              Icon(Icons.circle, color: associatedColor(category.name),),
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownMenu(
          controller: inOutController,
          dropdownMenuEntries: [
            DropdownMenuEntry(label: "In", value: "In"),
            DropdownMenuEntry(label: "Out", value: "Out")
          ]
        ),
        CategoriesGridSelectable(categoriesController),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: valueController,
        )
      ],
    );
  }
}
