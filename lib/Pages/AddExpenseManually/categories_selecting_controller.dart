import 'package:allassabudget/Storage/Models/category.dart';

/// Controller for the custom [categories_list_selectable] widget
class CategoiesSelectingController {
  List<Category> categoriesList = [];

  void addCategory(Category category) {
    categoriesList.add(category);
  }

  void removeCategory(Category category) {
    categoriesList.remove(category);
  }
}
