import 'package:delicious/core/exceptions/menu/category_exception/cannot_add_category_exception.dart';
import 'package:delicious/core/exceptions/menu/inavalid_text_exception.dart';
import 'package:delicious/core/exceptions/menu/invalid_image_exception.dart';
import 'package:delicious/features/menu/domain/entity/category_entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';

class AddCategoryUsecase {
  final CategoryRepository categoryRepository;
  AddCategoryUsecase({required this.categoryRepository});
  Future<void> call({
    required String name,
    required String image,
  }) async {
    if (name.trim().isEmpty) {
      throw InavlidTextException();
    }
    if (image.isEmpty) {
      throw InvalidImageException();
    }
    try {
      await categoryRepository.uploadCatecoryImage(name, image).then(
          (value) async => await categoryRepository
              .addCategory(CategoryEntity(id: '', name: name, image: value)));
    } catch (e) {
      throw CannotAddCategoryException();
    }
  }
}
