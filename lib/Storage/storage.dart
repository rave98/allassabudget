import 'package:allassabudget/Storage/Models/category.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:allassabudget/logger.dart';
import 'package:allassabudget/Storage/Models/expense.dart';
class Storage {
  static Isar? localStorage;

  static setupLocalStorage() async {
    logger.info('Connecting to Isar');
    final dir = await getApplicationDocumentsDirectory();
    localStorage = await Isar.open(
      [ExpenseSchema, CategorySchema],
      directory: dir.path
    );
  }

  static Future<void> addCategory(Category category) async {
    await localStorage!.writeTxn(() async => localStorage!.categorys.put(category));
  }

  static Future<void> addExpense(Expense expense) async {
    await localStorage!.writeTxn(() async => localStorage!.expenses.put(expense));
  }
  
  /// performs a select sum(price) from expenses group by category
  /// returns a map that associates each category to the total expenses for that category
  static Future<Map<String, double>> categoryGroupedExpenses() async {
    List<Expense> expenses  = await localStorage!.expenses
      .where()
      .findAll();
    Map<String, double> groupedExpenses = {};
    for (var e in expenses) {
      for (var c in e.categories) {
        groupedExpenses.update(c, (value) => value += e.amount / 100, ifAbsent: () => e.amount / 100);
      }
    }
    return groupedExpenses;
  }

  /// selects all the egresses from the wallet and returns them aggregated
  static Future<int> losses() async {
    return localStorage!.expenses
      .filter()
      .amountGreaterThan(0)
      .amountProperty()
      .sum();
  }

  /// selects all gains in the wallet and returns them aggregated
  static Future<int> gains() async {
    return localStorage!.expenses
      .filter()
      .amountLessThan(0)
      .amountProperty()
      .sum();
  }
}
