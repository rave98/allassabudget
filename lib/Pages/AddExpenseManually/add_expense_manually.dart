import 'package:allassabudget/Pages/AddExpenseManually/categories_grid_selectable.dart';
import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:allassabudget/Storage/Models/expense.dart';
import 'package:allassabudget/utils.dart';
import 'package:allassabudget/Storage/storage.dart';
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

  void confirmAddExpense() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("${inOutController.text == "In" ? "+" : "-"}${valueController.text}"),
        content: Column(
          children: categoriesController
            .categoriesList.map((category) => Row(children: [
              Icon(Icons.circle, color: associatedColor(category.name),),
              Text(category.name)
            ],)).toList()
          ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              await Storage.addExpense(Expense(
                timeStamp: DateTime.now(), 
                categories: categoriesController.categoriesList.map((c) => c.name).toList(), 
                isRecurring: false, 
                amount: int.parse(valueController.text) * 100)
              );
            }, 
            child: Text("Confirm")
          )
        ],
      );
    },);
  }

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
          decoration: InputDecoration(
            suffixIcon: Container(
              margin: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.check),
                onPressed: confirmAddExpense,
              ),
            ),
          ),
        )
      ],
    );
  }
}
