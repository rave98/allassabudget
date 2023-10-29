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
  bool isRecurring = false;
  List<int> recurringSpecs = [0, 0];

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
            onPressed: () {
              Storage.addExpense(Expense(
                timeStamp: DateTime.now(), 
                categories: categoriesController.categoriesList.map((c) => c.name).toList(), 
                isRecurring: false,
                recurringInterval: recurringSpecs[0],
                recurringSpan: recurringSpecs[1],
                amount: int.parse(valueController.text) * 100)
              );
              Navigator.of(context).pop();
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownMenu(
          controller: inOutController,
          initialSelection: "In",
          dropdownMenuEntries: const [
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
              margin: const EdgeInsets.all(8),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: confirmAddExpense,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Text("Is this expense recurring?"),
            Checkbox(
              value: isRecurring, 
              onChanged: (value) => isRecurring = value ?? false)
          ]
        ),
        if (isRecurring)
          Row(
            children: [
              // TODO: add wheel choosers for recurringSpan and recurringInterval
            ],
          )
        ElevatedButton(onPressed: confirmAddExpense, child: const Text("Add"))
      ],
    );
  }
}
