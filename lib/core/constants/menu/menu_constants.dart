import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_constants.g.dart';

class MenuConstants {
  final txtMenuAppbarTitle = 'Menu';
  final txtAddCategoryAppbarTitle = 'Add Category';
  final txtCategoryName = 'Category Name';
  final txtCategoryImage = 'Category Image';
  final txtAddImage = 'Add Image';
  final txtAddCategoryBtn = 'Add Category';
}

@riverpod
MenuConstants menuConstants(MenuConstantsRef ref) {
  return MenuConstants();
}
