import 'package:isar/isar.dart';

part 'category.g.dart';

/// Isar annotated class representing a single category
@collection
class Category {
  Id id = Isar.autoIncrement;

  /// the category name
  final String name;

  Category({required this.name});
}
