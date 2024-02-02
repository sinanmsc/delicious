import 'package:delicious/features/menu/data/model/dish_model/dish_model.dart';

abstract class DishFirestoreDatasource {
  Future<void> addDish(DishModel dish);
  Future<void> removeDish(DishModel dish);
  Future<void> updateDish(DishModel dish);
  Stream<List<DishModel>> getDish();
  Future<String> uploadDishImage(String name, String filePath);
}
