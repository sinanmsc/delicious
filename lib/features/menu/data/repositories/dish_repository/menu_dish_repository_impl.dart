import 'package:delicious/features/menu/data/datasource/dish_firestore/dish_firestore_datasource.dart';
import 'package:delicious/features/menu/data/datasource/dish_firestore/dish_firestore_datasource_impl.dart';
import 'package:delicious/features/menu/data/model/dish_model/dish_model.dart';
import 'package:delicious/features/menu/domain/entity/dish_entity/dish_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_dish_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_dish_repository_impl.g.dart';

class DishRepositoryImpl implements DishRepository {
  final DishFirestoreDatasource datasource;
  DishRepositoryImpl({required this.datasource});
  @override
  Future<void> addDish(DishEntity dish) async {
    await datasource.addDish(DishModel(
      id: dish.id,
      name: dish.name,
      image: dish.image,
      discription: dish.discription,
      ingredients: dish.ingredients,
      variants: dish.variants,
      addons: dish.addons,
    ));
  }

  @override
  Future<String?> uploadDishimage(String name, String filePath) async {
    return await datasource.uploadDishImage(name, filePath);
  }
}

@riverpod
DishRepository dishRepository(DishRepositoryRef ref) {
  return DishRepositoryImpl(
      datasource: ref.watch(dishFirestoreDatasourceProvider));
}
