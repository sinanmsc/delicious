import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewDishHead extends ConsumerWidget {
  const ViewDishHead({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: spaces.space_900 * 2,
            backgroundImage: const AssetImage('asset/order_images/food2.png'),
          ),
        ),
        SizedBox(height: spaces.space_400),
        Text(
          ref.watch(menuConstantsProvider).txtDishDiscriptionTitle,
          style: typography.h400,
        ),
        SizedBox(height: spaces.space_150),
        Text(
          '''The [overflow] property's behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, and those that follow, will not be rendered. Otherwise, it will be shown with the given overflow option.''',
          style: typography.small,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
