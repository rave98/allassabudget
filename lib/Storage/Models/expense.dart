import 'package:isar/isar.dart';

part 'expense.g.dart';

/// Isar annotated class representing the persisted expense
@collection
class Expense {
  Id id = Isar.autoIncrement;

  /// time of the addition of the expense
  final DateTime timeStamp;

  /// list of categories this expense fall in
  final List<String> categories;

  /// amount in cents
  final int amount;

  Expense({required this.timeStamp, required this.categories, required this.amount});
}
