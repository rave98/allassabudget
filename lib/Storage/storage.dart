import 'package:allassabudget/Storage/Models/category.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:allassabudget/logger.dart';
import 'package:allassabudget/Storage/Models/expense.dart';
class Storage {
  static Isar? localStorage;

  static void setupLocalStorage() async {
    logger.info('Connecting to Isar');
    final dir = await getApplicationDocumentsDirectory();
    localStorage = await Isar.open(
      [ExpenseSchema, CategorySchema],
      directory: dir.path
    );
  }
}
