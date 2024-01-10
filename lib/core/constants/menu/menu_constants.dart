import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_constants.g.dart';

class MenuConstants {
  final txtOk = 'OK';
  final txtMenuAppbarTitle = 'Menu';
  final txtAddCategoryAppbarTitle = 'Add Category';
  final txtCategoryName = 'Category Name';
  final txtDishName = 'Dish Name';
  final txtCategoryImage = 'Category Image';
  final txtDishesImage = 'Dish Image';
  final txtAddImage = 'Add Image';
  final txtAddCategoryBtn = 'Add Category';
  final txtAddDishBtn = 'Add Dish';
  final txtAddDishAppbarTitle = 'New Dish';
  final txtAddDishDiscription = 'Discription';
  final txtAddDishIngredient = 'Ingredient';
  final txtAddDishVariant = 'Variant';
  final txtAddIngredientTitle = 'Add Ingredient';
  final txtAddVariantTitle = 'Add Variant';
  final txtAddDishAddons = 'Addons';
  final txtAddAddonsTitle = 'Add Addons';
}

@riverpod
MenuConstants menuConstants(MenuConstantsRef ref) {
  return MenuConstants();
}
