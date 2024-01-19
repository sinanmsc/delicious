import 'package:delicious/core/exceptions/menu/cannot_update_category_exception.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';

class UpdateCategoryUsecase {
  final CategoryRepository categoryRepository;
  UpdateCategoryUsecase({required this.categoryRepository});
  call(CategoryEntity category) async {
    try {
      categoryRepository.updateCategory(category);
    } catch (e) {
      throw CannotUpdateCategoryException();
    }
  }
}
