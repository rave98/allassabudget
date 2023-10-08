import 'package:allassabudget/Storage/Models/category.dart';
import 'package:allassabudget/logger.dart';
/// Controller for the custom [categories_list_selectable] widget
class CategoiesSelectingController {
  List<Category> categoriesList = [];

  void clear() {
    categoriesList = [];
  }

  void toggleCategory(Category category) {
    if(categoriesList.contains(category)) {
      logger.info("Removing category ${category.name}");
      categoriesList.remove(category);
    }
    else {
      logger.info("Selecting category ${category.name}");
      categoriesList.add(category);
    }
  }

  void addCategory(Category category) {
    categoriesList.add(category);
  }

  void removeCategory(Category category) {
    categoriesList.remove(category);
  }
}
