import 'package:delicious/core/exceptions/menu/dish_exception/cannot_add_dish_exception.dart';
import 'package:delicious/core/exceptions/menu/inavalid_text_exception.dart';
import 'package:delicious/core/exceptions/menu/invalid_image_exception.dart';
import 'package:delicious/features/menu/domain/entity/dish_entity/dish_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_dish_repository.dart';

class AddDishUsecase {
  final DishRepository dishRepository;
  AddDishUsecase({required this.dishRepository});
  call(DishEntity dish) {
    try {
      if (dish.name.trim().isEmpty || dish.discription.trim().isEmpty) {
        throw InavlidTextException();
      }
      if (dish.image.isEmpty) {
        throw InvalidImageException();
      }
      dishRepository.addDish(dish);
    } catch (e) {
      throw CannotAddDishCategory();
    }
  }
}
