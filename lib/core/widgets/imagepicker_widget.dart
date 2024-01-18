import 'dart:io';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagePickerWidget extends ConsumerWidget {
  final String headText;
  final void Function() onTap;
  final String imagePath;
  final String? imageForUpdate;
  const ImagePickerWidget({
    super.key,
    required this.headText,
    required this.onTap,
    required this.imagePath,
    this.imageForUpdate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    Widget widgetToShow = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          color: Colors.grey[700],
          size: spaces.space_500,
        ),
        SizedBox(height: spaces.space_100),
        Text(
          ref.watch(menuConstantsProvider).txtAddImage,
          style: typography.h500,
        )
      ],
    );

    if (imageForUpdate != null) {
      widgetToShow = Image.network(
        imageForUpdate!,
        fit: BoxFit.cover,
      );
    }

    if (imagePath.isNotEmpty) {
      widgetToShow = Image.file(
        File(imagePath),
        fit: BoxFit.cover,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headText,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_400),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(spaces.space_900 * 2),
            child: InkWell(
              onTap: () => onTap(),
              borderRadius: BorderRadius.circular(spaces.space_900 * 2),
              child: Ink(
                width: spaces.space_900 * 4,
                height: spaces.space_900 * 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.backgroundLight,
                ),
                child: widgetToShow,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
