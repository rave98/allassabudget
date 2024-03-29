import 'package:isar/isar.dart';

part 'category.g.dart';

/// Isar annotated class representing a single category
@collection
class Category {
  Id id = Isar.autoIncrement;

  /// the category name
  final String name;
  
  /// budget cap for the category. Zero means no cap
  int cap;

  Category({required this.name, this.cap = 0});

  @override
  int get hashCode {
    return id;
  }

  @override
  bool operator ==(other) {
    return other is Category && id == other.id;
  }
}
