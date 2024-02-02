import 'package:delicious/features/menu/domain/entity/dish_entity/dish_entity.dart';

abstract class DishRepository {
  Future<void> addDish(DishEntity dish);
  Future<String?> uploadDishimage(String name, String filePath);
}
