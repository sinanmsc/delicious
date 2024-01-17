import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/ingredient_chip_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/variant_or_addon_table_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/view_dish_appbar_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/view_dish_head_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewDish extends ConsumerWidget {
  const ViewDish({super.key});

  static const routerPath = '/view_dish';
  static const routerName = 'View Dish';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final a = ref.watch(menuProvider).incredients.entries.toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, spaces.space_125 * 5.5),
        child: const ViewDishAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spaces.space_300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ViewDishHead(),
              SizedBox(height: spaces.space_300),
              Text(
                ref.watch(menuConstantsProvider).txtDishIngredientTitle,
                style: typography.h400,
              ),
              SizedBox(
                height: spaces.space_900,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => IngredientChip(
                      keyWord: a[index].key, value: a[index].value),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: spaces.space_100),
                  itemCount: a.length,
                ),
              ),
              VariantOrAddonList(
                headText: ref.watch(menuConstantsProvider).txtAddDishVariant,
                name: 'Half Biriyani',
                price: '100',
                itemCount: 4,
              ),
              SizedBox(height: spaces.space_300),
              VariantOrAddonList(
                headText: ref.watch(menuConstantsProvider).txtAddAddonsTitle,
                name: 'Curd',
                price: '20',
                itemCount: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
