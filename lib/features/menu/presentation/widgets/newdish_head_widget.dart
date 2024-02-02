import 'dart:developer';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:delicious/core/widgets/imagepicker_widget.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class NewDishHeadWidget extends ConsumerWidget {
  const NewDishHeadWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePicker = ImagePicker();
    final spaces = AppTheme.of(context).spaces;

    return Column(
      children: [
        ImagePickerWidget(
          headText: ref.watch(menuConstantsProvider).txtDishesImage,
          onTap: () async {
            try {
              XFile? pickedImage =
                  await imagePicker.pickImage(source: ImageSource.camera);
              if (pickedImage!=null) {
                ref.read(menuProvider.notifier).addDishImage(pickedImage.path);
              }    
            } catch (e) {
              log('$e');
            }
          },
          imagePath: ref.watch(menuProvider).dishImage,
        ),
        SizedBox(height: spaces.space_500),
        CustomTextField(
          controller: ref.read(menuProvider.notifier).addDishNameController,
          hintText: 'Chicken Biriyani',
          headText: ref.watch(menuConstantsProvider).txtDishName,
          prifixIcon: Icon(
            Icons.local_dining,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
