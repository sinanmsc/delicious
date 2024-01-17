import 'package:delicious/features/menu/data/model/category_model.dart';

abstract class CategoryObjectboxDatasource {
  void saveCategories(List<CategoryModel> categories);
  List<CategoryModel> getCategories();
}
