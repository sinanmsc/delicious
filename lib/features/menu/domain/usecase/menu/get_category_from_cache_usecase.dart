import 'package:delicious/core/exceptions/menu/cannot_get_category_exception.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';

class GetCategoryFromCacheUseCase {
  final CategoryRepository categoryRepository;
  GetCategoryFromCacheUseCase({required this.categoryRepository});
  List<CategoryEntity> call() {
    try {
      final categories = categoryRepository.getCategoryFromCache();
      return [
        for (var i in categories)
          CategoryEntity(id: i.id, name: i.name, image: i.image)
      ];
    } catch (e) {
      throw CannotGetCategoryException();
    }
  }
}
