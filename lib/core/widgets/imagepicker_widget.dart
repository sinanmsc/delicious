import 'dart:io';

import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagePickerWidget extends ConsumerWidget {
  final String headText;
  final void Function() onTap;
  final String imagePath;
  const ImagePickerWidget({
    super.key,
    required this.headText,
    required this.onTap,
    required this.imagePath,
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
          headText,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_400),
        Center(
          child: InkWell(
            onTap: () => onTap(),
            child: CircleAvatar(
              radius: spaces.space_900 * 2,
              backgroundColor: colors.backgroundLight,
              backgroundImage: imagePath.isEmpty
                  ? null
                  : FileImage(
                      File(
                        imagePath,
                      ),
                    ),
              child: imagePath.isEmpty
                  ? Column(
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
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
