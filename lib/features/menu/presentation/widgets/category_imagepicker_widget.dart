import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CategoryImagePickerWidget extends ConsumerWidget {
  const CategoryImagePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ref.watch(menuConstantsProvider).txtCategoryImage,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_300),
        Center(
          child: InkWell(
            onTap: () async {
              XFile? pickedImage = await ref
                  .read(menuProvider.notifier)
                  .imagePicker
                  .pickImage(source: ImageSource.camera);

              if (pickedImage != null) {
                ref.read(menuProvider.notifier).getImage(pickedImage.path);
              }
            },
            child: CircleAvatar(
              radius: spaces.space_900 * 2,
              backgroundColor: colors.backgroundLight,
              backgroundImage: ref.watch(menuProvider) != null
                  ? AssetImage(ref.watch(menuProvider)!)
                  : null,
              child: ref.watch(menuProvider) != null
                  ? null
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: spaces.space_500,
                        ),
                        SizedBox(height: spaces.space_100),
                        Text(
                          ref.watch(menuConstantsProvider).txtAddImage,
                          style: typography.h500,
                        )
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
