import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddVariantDialogWidget extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final String dialogTitle;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final void Function() onPressed;
  AddVariantDialogWidget({
    super.key,
    required this.dialogTitle,
    required this.nameController,
    required this.priceController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    return AlertDialog(
      title: Text(dialogTitle),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              prifixIcon: const Icon(Icons.local_dining),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the variant name';
                }
                return null;
              },
            ),
            SizedBox(height: spaces.space_200),
            CustomTextField(
              controller: priceController,
              hintText: 'Price',
              prifixIcon: const Icon(Icons.attach_money_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the variant price';
                }
                return null;
              },
            ),
            SizedBox(height: spaces.space_200),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onPressed();
              Navigator.pop(context);
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
