import 'package:delicious/core/exceptions/menu/cannot_get_category_exception.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';
import 'package:delicious/features/menu/domain/usecase/menu/get_category_from_cache_usecase.dart';
import 'package:delicious/features/menu/domain/usecase/menu/save_category_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetCategoryUsecase {
  final CategoryRepository categoryRepository;
  GetCategoryUsecase({required this.categoryRepository});

  Stream<List<CategoryEntity>> call() async* {
    bool connection = await InternetConnectionChecker().hasConnection;
    if (connection) {
      try {
        final categories = categoryRepository.getCategory();
        await for (var category in categories) {
          await SaveCategoryusecase(categoryRepository: categoryRepository)(
              category);
          yield category;
        }
      } catch (e) {
        throw CannotGetCategoryException();
      }
    } else {
      yield GetCategoryFromCacheUseCase(
          categoryRepository: categoryRepository)();
    }
  }
}
