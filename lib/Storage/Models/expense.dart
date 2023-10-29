import 'package:isar/isar.dart';

part 'expense.g.dart';

/// Isar annotated class representing the persisted expense
@collection
class Expense {
  Id id = Isar.autoIncrement;

  /// time of the addition of the expense
  final DateTime timeStamp;

  /// list of categories this expense fall in
  /// this could be a list of Categories instead of Strings, but since they are only String wrappers for now 
  /// I will leave it like this
  final List<String> categories;

  /// flag for recurring expenses. This is set by the user
  final bool isRecurring;

  /// The recurrence interval, so 'how many recurringSpan is this expense recurring'. 0 if isRecurring is false
  final int recurringInterval;

  /// Could either be
  /// 0 - isRecurring is false
  /// 1 days
  /// 2 weeks
  /// 3 months
  final int recurringSpan;

  /// amount in cents
  final int amount;

  Expense({required this.timeStamp, required this.categories, required this.isRecurring, required this.recurringInterval, required this.recurringSpan, required this.amount});

  @override
  int get hashCode {
    return id;
  }

  @override
  bool operator ==(other) {
    return other is Expense && id == other.id;
  }
}
