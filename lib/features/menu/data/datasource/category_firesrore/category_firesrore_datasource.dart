import 'package:delicious/features/menu/data/model/category_model.dart';

abstract class CategoryFirestoreDatasource {
  Future<void> addCategory(CategoryModel category);
  Future<void> removeCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Stream<List<CategoryModel>> getCategory();
  Future<String> uploadCatecoryImage(String name, String filePath);
}
