import 'dart:developer';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/imagepicker_widget.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/add_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddCategory extends ConsumerWidget {
  static const routerPath = '/add_category';
  static const routerName = 'Add Category';
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final imagePicker = ImagePicker();

    void onAddCategory() async {
      ref.read(menuProvider.notifier).toggleLoading();
      await ref
          .read(menuProvider.notifier)
          .addCategoryToFirestore()
          .then((errorMsg) {
        if (errorMsg == null) {
          context.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMsg,
                style: typography.smallHead,
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(spaces.space_500),
              backgroundColor: colors.backgroundLight,
              shape: const StadiumBorder(),
            ),
          );
        }
      });
      ref.read(menuProvider.notifier).toggleLoading();
    }

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
                    controller: ref
                        .read(menuProvider.notifier)
                        .addCategoryNameController,
                    hintText: 'Biriyani',
                    headText: ref.watch(menuConstantsProvider).txtCategoryName,
                    prifixIcon: const Icon(Icons.local_dining_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(spaces.space_300),
        child: AddBtn(
          isLoading: ref.watch(menuProvider).isLoading,
          text: ref.watch(menuConstantsProvider).txtAddCategoryBtn,
          onPressed: onAddCategory,
        ),
      ),
    );
  }
}
