import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DishDiscriptionWidget extends ConsumerWidget {
  const DishDiscriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ref.watch(menuConstantsProvider).txtDishDiscriptionTitle,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_200),
        SizedBox(
          height: spaces.space_200 * 10,
          child: TextField(
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(spaces.space_125),
                borderSide: const BorderSide(width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(spaces.space_125),
                borderSide: const BorderSide(width: 0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
