import 'dart:developer';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/utils/snackbar_utils.dart';
import 'package:delicious/core/widgets/imagepicker_widget.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/add_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddCategory extends ConsumerWidget {
  static const routerPath = '/add_category';
  static const routerName = 'Add Category';
  final CategoryEntity? category;
  const AddCategory({super.key, this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final imagePicker = ImagePicker();

    void imagePicking() async {
      try {
        XFile? pickedImage =
            await imagePicker.pickImage(source: ImageSource.camera);
        if (pickedImage != null) {
          ref.read(menuProvider.notifier).addCategoryImage(pickedImage.path);
        }
      } catch (e) {
        log('$e');
      }
    }

    void onAddCategory() async {
      ref.read(menuProvider.notifier).toggleLoading();
      await ref
          .read(menuProvider.notifier)
          .addCategoryToFirestore()
          .then((errorMsg) {
        if (errorMsg == null) {
          context.pop();
        } else {
          snackBarWhenClickBtn(context, errorMsg);
        }
      });
      ref.read(menuProvider.notifier).toggleLoading();
    }

    if (category != null) {
      ref.read(menuProvider.notifier).addCategoryNameController.text =
          category!.name;
    }

    void onUpdate() async {
      ref.read(menuProvider.notifier).toggleLoading();
      await ref
          .read(menuProvider.notifier)
          .updateCategory(category!)
          .then((erroeMsg) {
        if (erroeMsg == null) {
          snackBarWhenClickBtn(context, 'Category Updated');
          context.pop();
        } else {
          snackBarWhenClickBtn(context, erroeMsg);
        }
        return null;
      });
      ref.read(menuProvider.notifier).toggleLoading();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.btnPrimary,
        title: Text(
          category == null
              ? ref.watch(menuConstantsProvider).txtAddCategoryAppbarTitle
              : 'Edit Category',
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
                    imageForUpdate: category?.image,
                    headText: ref.watch(menuConstantsProvider).txtCategoryImage,
                    onTap: imagePicking,
                    imagePath: ref.watch(menuProvider).categoryImage,
                  ),
                  SizedBox(height: spaces.space_700),
                  CustomTextField(
                    controller: ref
                        .read(menuProvider.notifier)
                        .addCategoryNameController,
                    hintText: ref.watch(menuConstantsProvider).txtDemoDishName,
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
          text: category == null
              ? ref.watch(menuConstantsProvider).txtAddCategoryBtn
              : ref.watch(menuConstantsProvider).txtUpdateCategoryBtn,
          onPressed: category == null ? onAddCategory : onUpdate,
        ),
      ),
    );
  }
}

