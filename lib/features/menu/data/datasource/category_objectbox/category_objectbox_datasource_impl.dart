import 'package:delicious/core/local_db/objectbox.dart';
import 'package:delicious/features/menu/data/datasource/category_objectbox/category_objectbox_datasource.dart';
import 'package:delicious/features/menu/data/model/category_model/category_box_model.dart';
import 'package:delicious/features/menu/data/model/category_model/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_objectbox_datasource_impl.g.dart';

class CategoryObjectboxDatasourceImpl implements CategoryObjectboxDatasource {
  @override
  List<CategoryModel> getCategories() {
    final boxModels = ObjectBox.instance.categoryBox.getAll();
    return [
      for (final boxModel in boxModels)
        CategoryModel(
            id: boxModel.categoryId!,
            name: boxModel.name!,
            image: boxModel.image!)
    ];
  }

  @override
  void saveCategories(List<CategoryModel> categories) {
    ObjectBox.instance.categoryBox.removeAll();
    ObjectBox.instance.categoryBox.putMany(
      [
        for (final model in categories)
          CategoryBoxModel()
            ..categoryId = model.id
            ..image = model.image
            ..name = model.name
      ],
    );
  }
}

@riverpod
CategoryObjectboxDatasource categoryObjectboxDatasource(
    CategoryObjectboxDatasourceRef ref) {
  return CategoryObjectboxDatasourceImpl();
}
