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
  @override
  MenuState build() {
    incredientController = TextEditingController();
    variantNameController = TextEditingController();
    variantPriceController = TextEditingController();
    addonNameController = TextEditingController();
    addonPriceController = TextEditingController();
    ref.onDispose(() {
      dispose();
    });
    return MenuState(
      incredients: {},
      variants: {},
      addons: {},
      dishImage: '',
      categoryImage: '',
    );
  }

  void addIngredient(String ingredient, String image) {
    state =
        state.copyWith(incredients: {...state.incredients, ingredient: image});
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
