import 'dart:developer';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddIngredientDialog extends HookConsumerWidget {
  final formKey = GlobalKey<FormState>();
  AddIngredientDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final imagPicker = ImagePicker();
    final incredientImage = useState<String?>(null);
    return AlertDialog(
      title: Text(ref.watch(menuConstantsProvider).txtAddIngredientTitle),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: ref.read(menuProvider.notifier).incredientController,
              hintText: 'Incredient Name',
              prifixIcon: const Icon(Icons.food_bank),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the incredient name';
                }
                return null;
              },
            ),
            SizedBox(height: spaces.space_200),
            ElevatedButton(
              onPressed: () async {
                try {
                  XFile? pickedImage =
                      await imagPicker.pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    incredientImage.value = pickedImage.path;
                  }
                } catch (e) {
                  log('$e');
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, spaces.space_500),
                  backgroundColor: colors.btnPrimary),
              child: Text('Add Image', style: typography.h400Invers),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              incredientImage.value == null ||
                      ref
                          .read(menuProvider.notifier)
                          .incredientController
                          .text
                          .isEmpty
                  ? () {}
                  : ref.read(menuProvider.notifier).addIngredient(
                        ref
                            .read(menuProvider.notifier)
                            .incredientController
                            .text,
                        incredientImage.value!,
                      );
              ref.read(menuProvider.notifier).clearingController();
              Navigator.pop(context);
              incredientImage.value = null;
            }
          },
          child: Text(
            ref.watch(menuConstantsProvider).txtOk,
          ),
        ),
      ],
    );
  }
}
