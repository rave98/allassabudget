import 'package:allassabudget/Pages/AddExpenseManually/categories_grid_selectable.dart';
import 'package:allassabudget/Pages/AddExpenseManually/categories_selecting_controller.dart';
import 'package:allassabudget/Storage/Models/expense.dart';
import 'package:allassabudget/utils.dart';
import 'package:allassabudget/Storage/storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddExpenseManually extends StatefulWidget {
  AddExpenseManually({super.key});

  @override
  State<AddExpenseManually> createState() => _AddExpenseManuallyState();
}

class _AddExpenseManuallyState extends State<AddExpenseManually> {
  final TextEditingController inOutController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final CategoriesSelectingController categoriesController = CategoriesSelectingController();
  final TextEditingController recurrenceController = TextEditingController();
  bool isRecurring = false;

  // [ recurring interval, recurring span ]
  List<int> recurringSpecs = [0, 0];

  void confirmAddExpense() {
    if (recurrenceController.text.isNotEmpty) {
      setState(() => recurringSpecs[0] = int.parse(recurrenceController.text));
    } 
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
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(AppLocalizations.of(context)!.cancel)),
          ElevatedButton(
            onPressed: () {
              Storage.addExpense(Expense(
                timeStamp: DateTime.now(), 
                categories: categoriesController.categoriesList.map((c) => c.name).toList(), 
                isRecurring: isRecurring,
                recurringInterval: recurringSpecs[0],
                recurringSpan: recurringSpecs[1],
                amount: int.parse(valueController.text) * 100)
              );
              Navigator.of(context).pop();
            }, 
            child: Text(AppLocalizations.of(context)!.confirm)
          )
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
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
            Expanded(
              child: Center(child: Text(AppLocalizations.of(context)!.recurringExpense))
            ),
            Checkbox(
              value: isRecurring, 
              onChanged: (value) => setState(() => isRecurring = value ?? false))
          ]
        ),
        if (isRecurring)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.every),
                Expanded(
                  child: TextField(
                    controller: recurrenceController, 
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  )
                ),
                DropdownMenu(
                  initialSelection: Recurrences.day,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: Recurrences.day, label: AppLocalizations.of(context)!.days),
                    DropdownMenuEntry(value: Recurrences.week, label: AppLocalizations.of(context)!.weeks),
                    DropdownMenuEntry(value: Recurrences.month, label: AppLocalizations.of(context)!.months),
                    DropdownMenuEntry(value: Recurrences.year, label: AppLocalizations.of(context)!.years),
                  ],
                  onSelected: (Recurrences? option) => setState(() => recurringSpecs[1] = option?.index ?? 0),
                )
              ],
            )
          ),
        ElevatedButton(onPressed: confirmAddExpense, child: Text(AppLocalizations.of(context)!.addExpense))
      ],
    );
  }
}
