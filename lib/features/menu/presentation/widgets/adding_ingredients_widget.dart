import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/add_ingredient_dialog_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/ingredient_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddingIngredientWidget extends HookConsumerWidget {
  const AddingIngredientWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;
    final ingredients = ref.watch(menuProvider).incredients;

    void addingToIngredients() {
      showDialog(context: context, builder: (context) => AddIngredientDialog());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ref.watch(menuConstantsProvider).txtDishIngredientTitle,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_100),
        Wrap(children: [
          for (var i in ingredients.entries)
            Padding(
              padding: EdgeInsets.only(
                right: spaces.space_200,
                bottom: spaces.space_100,
              ),
              child: IngredientChip(keyWord: i.key, value: i.value),
            ),
          InkWell(
            onTap: () => addingToIngredients(),
            child: Container(
                margin: EdgeInsets.only(top: spaces.space_100),
                padding: EdgeInsets.all(spaces.space_200),
                decoration: BoxDecoration(boxShadow: boxShadow.overlay),
                child: const Icon(
                  Icons.add,
                )),
          ),
        ]),
      ],
    );
  }
}
