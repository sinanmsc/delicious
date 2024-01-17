import 'package:delicious/core/exceptions/menu/cannot_add_category_exception.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';

class SaveCategoryusecase {
  final CategoryRepository categoryRepository;
  SaveCategoryusecase({required this.categoryRepository});
  call(List<CategoryEntity> categories) {
    try {
      categoryRepository.saveCategories(categories);
    } catch (e) {
      throw CannotAddCategoryException();
    }
  }
}
