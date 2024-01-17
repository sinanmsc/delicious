import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VariantAddonsList extends ConsumerWidget {
  final String listHead;
  final void Function() onTap;
  final List<MapEntry<String, String>> listMap;
  const VariantAddonsList({
    super.key,
    required this.listHead,
    required this.listMap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final boxShadow = AppTheme.of(context).boxShadow;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          listHead,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_200),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(spaces.space_200),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spaces.space_100),
              boxShadow: boxShadow.overlay,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listMap[index].key,
                  style: typography.h500,
                ),
                Text(
                  '\$${listMap[index].value}',
                  style: typography.h500,
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: spaces.space_100,
          ),
          itemCount: listMap.length,
        ),
        SizedBox(height: spaces.space_150),
        InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: EdgeInsets.all(spaces.space_200),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spaces.space_100),
              boxShadow: boxShadow.overlay,
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
