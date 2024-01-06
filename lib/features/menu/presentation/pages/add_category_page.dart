import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/extensions/colors_extension.dart';
import 'package:delicious/core/theme/extensions/space_extension.dart';
import 'package:delicious/core/theme/extensions/typography_extension.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/widgets/category_imagepicker_widget.dart';
import 'package:delicious/features/orders/presentation/widgets/order_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCategory extends ConsumerWidget {
  static const routPath = '/add_category';
  static const routName = 'Add Category';
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.btnPrimary,
        title: Text(
          ref.watch(menuConstantsProvider).txtAddCategoryAppbarTitle,
          style: typography.appbarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spaces.space_300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ref.watch(menuConstantsProvider).txtCategoryName,
                style: typography.smallHead,
              ),
              SizedBox(height: spaces.space_150),
              const OrderTextField(hintText: 'Biriyani'),
              SizedBox(height: spaces.space_500),
              const CategoryImagePickerWidget(),
              SizedBox(height: spaces.space_400 * 4),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.btnPrimary,
                  minimumSize: Size(double.infinity, spaces.space_500),
                ),
                child: Text(
                  ref.watch(menuConstantsProvider).txtAddCategoryBtn,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
