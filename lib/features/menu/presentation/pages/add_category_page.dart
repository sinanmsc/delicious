import 'dart:developer';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/imagepicker_widget.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/add_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddCategory extends ConsumerWidget {
  static const routPath = '/add_category';
  static const routName = 'Add Category';
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final imagePicker = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.btnPrimary,
        title: Text(
          ref.watch(menuConstantsProvider).txtAddCategoryAppbarTitle,
          style: typography.appbarTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(spaces.space_300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ImagePickerWidget(
                  headText: ref.watch(menuConstantsProvider).txtCategoryImage,
                  onTap: () async {
                    try {
                      XFile? pickedImage = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      if (pickedImage != null) {
                        ref
                            .read(menuProvider.notifier)
                            .addCategoryImage(pickedImage.path);
                      }
                    } catch (e) {
                      log('$e');
                    }
                  },
                  imagePath: ref.watch(menuProvider).categoryImage,
                ),
                SizedBox(height: spaces.space_700),
                CustomTextField(
                  hintText: 'Biriyani',
                  headText: ref.watch(menuConstantsProvider).txtCategoryName,
                  prifixIcon: const Icon(Icons.local_dining_outlined),
                ),
              ],
            ),
            AddBtn(text: ref.watch(menuConstantsProvider).txtAddCategoryBtn)
          ],
        ),
      ),
    );
  }
}
