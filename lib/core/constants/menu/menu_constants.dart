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
  final txtUpdateCategoryBtn = 'Update Category';
  final txtAddDishBtn = 'Add Dish';
  final txtAddDishAppbarTitle = 'New Dish';
  final txtDishDiscriptionTitle = 'Discription';
  final txtDishIngredientTitle = 'Ingredients';
  final txtAddDishVariant = 'Variants';
  final txtAddIngredientTitle = 'Add Ingredient';
  final txtAddVariantTitle = 'Add Variant';
  final txtAddDishAddons = 'Addons';
  final txtAddAddonsTitle = 'Add Addons';
  final txtDemoDishName = 'Biriyani';
}

@riverpod
MenuConstants menuConstants(MenuConstantsRef ref) {
  return MenuConstants();
}
