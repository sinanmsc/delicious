
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VariantOrAddonList extends ConsumerWidget {
  final String name;
  final String price;
  final int itemCount;
  final String headText;
  const VariantOrAddonList({
    super.key,
    required this.name,
    required this.price,
    required this.itemCount,
    required this.headText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headText,
          style: typography.h400,
        ),
        SizedBox(height: spaces.space_150),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: typography.small,
              ),
              Text(
                '\$$price',
                style: typography.small,
              )
            ],
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: spaces.space_100),
          itemCount: itemCount,
        ),
      ],
    );
  }
}
