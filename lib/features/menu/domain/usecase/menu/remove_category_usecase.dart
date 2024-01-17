import 'package:delicious/core/exceptions/menu/cannot_remove_category_exception.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';

class RemoveCategoryUsecase {
  final CategoryRepository categoryRepository;
  RemoveCategoryUsecase({required this.categoryRepository});

  call(CategoryEntity category) async {
    try {
      await categoryRepository.removeCategory(category);
    } catch (e) {
      CannotRemoveCategoryExceptiion();
    }
  }
}
