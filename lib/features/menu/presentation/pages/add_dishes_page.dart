import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/add_btn_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/add_variant_or_addons_dialog_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/add_variant_addons_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/adding_ingredients_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/dish_discription_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/newdish_head_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddDishes extends ConsumerWidget {
  const AddDishes({super.key});
  static const routerPath = '/addDished';
  static const routerName = 'Add Dishes';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    void addingToVariants() {
      showDialog(
        context: context,
        builder: (context) => AddVariantOrAddonsDialogWidget(
          dialogTitle: ref.watch(menuConstantsProvider).txtAddVariantTitle,
          nameController: ref.read(menuProvider.notifier).variantNameController,
          priceController:
              ref.read(menuProvider.notifier).variantPriceController,
          onPressed: () {
            ref.read(menuProvider.notifier).addVariant(
                  ref.read(menuProvider.notifier).variantNameController.text,
                  ref.read(menuProvider.notifier).variantPriceController.text,
                );
            ref.read(menuProvider.notifier).clearingController();
          },
        ),
      );
    }

    void addingToAddons() {
      showDialog(
        context: context,
        builder: (context) => AddVariantOrAddonsDialogWidget(
          dialogTitle: ref.watch(menuConstantsProvider).txtAddAddonsTitle,
          nameController: ref.read(menuProvider.notifier).addonNameController,
          priceController: ref.read(menuProvider.notifier).addonPriceController,
          onPressed: () {
            ref.read(menuProvider.notifier).addAddons(
                ref.read(menuProvider.notifier).addonNameController.text,
                ref.read(menuProvider.notifier).addonPriceController.text);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.btnPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          ref.watch(menuConstantsProvider).txtAddDishAppbarTitle,
          style: typography.appbarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spaces.space_300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NewDishHeadWidget(),
              SizedBox(height: spaces.space_400),
              const DishDiscriptionWidget(),
              SizedBox(height: spaces.space_400),
              const AddingIngredientWidget(),
              SizedBox(height: spaces.space_400),
              VariantAddonsList(
                listHead: ref.watch(menuConstantsProvider).txtAddDishVariant,
                listMap: ref.watch(menuProvider).variants.entries.toList(),
                onTap: () => addingToVariants(),
              ),
              SizedBox(height: spaces.space_400),
              VariantAddonsList(
                listHead: ref.watch(menuConstantsProvider).txtAddDishAddons,
                listMap: ref.watch(menuProvider).addons.entries.toList(),
                onTap: () => addingToAddons(),
              ),
              SizedBox(height: spaces.space_800),
              AddBtn(
                text: ref.watch(menuConstantsProvider).txtAddDishBtn,
                isLoading: ref.watch(menuProvider).isLoading,
                onPressed: () {
                  ref.read(menuProvider.notifier).toggleLoading();
                  // ref.read(menuProvider.notifier).addDishes(DishEntity(id: '', name: ref.read(menuProvider.notifier).addDishNameController.text, image: image, discription: discription, ingredients: ingredients, variants: variants, addons: addons))
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
