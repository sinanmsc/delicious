import 'package:delicious/features/menu/data/datasource/category_firesrore/category_firesrore_datasource.dart';
import 'package:delicious/features/menu/data/datasource/category_firesrore/category_firesrore_datasource_impl.dart';
import 'package:delicious/features/menu/data/datasource/category_objectbox/category_objectbox_datasource.dart';
import 'package:delicious/features/menu/data/datasource/category_objectbox/category_objectbox_datasource_impl.dart';
import 'package:delicious/features/menu/data/model/category_model/category_model.dart';
import 'package:delicious/features/menu/domain/entity/category_entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_category_repository_impl.g.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryFirestoreDatasource datasource;
  final CategoryObjectboxDatasource cacheSource;
  CategoryRepositoryImpl({
    required this.datasource,
    required this.cacheSource,
  });

  @override
  Future<void> addCategory(CategoryEntity category) async {
    await datasource.addCategory(CategoryModel(
      id: category.id,
      name: category.name,
      image: category.image,
    ));
  }

  @override
  Future<void> removeCategory(CategoryEntity category) async {
    await datasource.removeCategory(CategoryModel(
      id: category.id,
      name: category.name,
      image: category.image,
    ));
  }

  @override
  Future<void> updateCategory(CategoryEntity category) async {
    await datasource.updateCategory(CategoryModel(
      id: category.id,
      name: category.name,
      image: category.image,
    ));
  }

  @override
  Stream<List<CategoryEntity>> getCategory() async* {
    await for (final modelList in datasource.getCategory()) {
      yield [
        for (final model in modelList)
          CategoryEntity(
            id: model.id,
            name: model.name,
            image: model.image,
          )
      ];
    }
  }

  @override
  Future<String> uploadCatecoryImage(String name, String filePath) {
    return datasource.uploadCatecoryImage(name, filePath);
  }

  @override
  void saveCategories(List<CategoryEntity> categories) {
    cacheSource.saveCategories([
      for (final category in categories)
        CategoryModel(
          id: category.id,
          name: category.name,
          image: category.image,
        )
    ]);
  }

  @override
  List<CategoryEntity> getCategoryFromCache() {
    final categories = cacheSource.getCategories();
    return [
      for (var category in categories)
        CategoryEntity(
            id: category.id, name: category.name, image: category.image)
    ];
  }

}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepositoryImpl(
    datasource: ref.watch(categoryFirestoreDatasourceProvider),
    cacheSource: ref.watch(categoryObjectboxDatasourceProvider),
  );
}
