import 'package:delicious/core/exceptions/base_exception.dart';
import 'package:delicious/features/menu/data/repositories/menu_category_repository_impl.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/domain/repositories/menu_category_repository.dart';
import 'package:delicious/features/menu/domain/usecase/menu/add_category_usecase.dart';
import 'package:delicious/features/menu/domain/usecase/menu/get_category_usecase.dart';
import 'package:delicious/features/menu/domain/usecase/menu/remove_category_usecase.dart';
import 'package:delicious/features/menu/domain/usecase/menu/update_category_usecase.dart';
import 'package:delicious/features/menu/presentation/providers/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_provider.g.dart';

@riverpod
class Menu extends _$Menu {
  late TextEditingController incredientController;
  late TextEditingController variantNameController;
  late TextEditingController variantPriceController;
  late TextEditingController addonNameController;
  late TextEditingController addonPriceController;
  late TextEditingController addCategoryNameController;
  late CategoryRepository categoryRepository;
  @override
  MenuState build() {
    incredientController = TextEditingController();
    variantNameController = TextEditingController();
    variantPriceController = TextEditingController();
    addonNameController = TextEditingController();
    addonPriceController = TextEditingController();
    addCategoryNameController = TextEditingController();
    categoryRepository = ref.watch(categoryRepositoryProvider);
    ref.onDispose(() {
      dispose();
    });
    return MenuState(
      incredients: {},
      variants: {},
      addons: {},
      dishImage: '',
      categoryImage: '',
      isLoading: false,
      categoryList: [],
      currentCategory: 0,
      // oldCategoryImage: '',
    );
  }

  //current category's index;
  void currentCategory(int index) {
    state = state.copyWith(currentCategory: index);
  }

  //add category to firestore
  Future<String?> addCategoryToFirestore() async {
    try {
      await AddCategoryUsecase(categoryRepository: categoryRepository)(
        name: addCategoryNameController.text,
        image: state.categoryImage,
      );
      addCategoryNameController.clear();
      state = state.copyWith(categoryImage: '');
    } on BaseException catch (e) {
      return e.message;
    } catch (e) {
      return 'Unknown error occured';
    }
    return null;
  }

  //remove category from firestore
  Future<String?> removeCategory() async {
    final currentCategory = state.categoryList[state.currentCategory];
    try {
      await RemoveCategoryUsecase(categoryRepository: categoryRepository)(
          currentCategory);
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }

  //get category details from firestore
  void getCategories() async {
    await for (final categories
        in GetCategoryUsecase(categoryRepository: categoryRepository)()) {
      state = state.copyWith(categoryList: categories);
    }
  }

  //update category to firestore
  Future<String?> updateCategory(CategoryEntity category) async {
    try {
      await UpdateCategoryUsecase(categoryRepository: categoryRepository)(
          category);
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }

  void addIngredient(String ingredient, String image) {
    state =
        state.copyWith(incredients: {...state.incredients, ingredient: image});
  }

  void toggleLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }

  void addVariant(String variant, String price) {
    state = state.copyWith(variants: {...state.variants, variant: price});
  }

  void addAddons(String addon, String price) {
    state = state.copyWith(addons: {...state.addons, addon: price});
  }

  void addDishImage(String imagePath) {
    state = state.copyWith(dishImage: imagePath);
  }

  void addCategoryImage(String imagePath) {
    state = state.copyWith(categoryImage: imagePath);
  }

  void clearingController() {
    incredientController.clear();
    variantNameController.clear();
    variantPriceController.clear();
    addonPriceController.clear();
    addonNameController.clear();
  }

  void dispose() {
    incredientController.dispose();
    variantNameController.dispose();
    variantPriceController.dispose();
    addonPriceController.dispose();
    addonNameController.dispose();
  }
}
