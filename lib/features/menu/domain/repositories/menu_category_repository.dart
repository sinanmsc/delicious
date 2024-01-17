import 'package:delicious/features/menu/data/model/category_model.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';

abstract class CategoryRepository {
  Future<void> addCategory(CategoryEntity category);
  Future<void> removeCategory(CategoryEntity category);
  Future<void> updateCategory(CategoryEntity category);
  Stream<List<CategoryEntity>> getCategory();
  Future<String> uploadCatecoryImage(String name, String filePath);
  void saveCategories(List<CategoryEntity> categories);
  List<CategoryModel> getCategoryFromCache();
}
