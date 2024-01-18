import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/theme_helper.dart';

class MenuPageBar extends ConsumerWidget {
  const MenuPageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var typography = AppTheme.of(context).typography;
    var spaces = AppTheme.of(context).spaces;
    return TabBar(
      isScrollable: true,
      onTap: (value) {
        ref.read(menuProvider.notifier).currentCategory(value);
      },
      padding: EdgeInsets.zero,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.white,
      labelStyle: typography.h400Invers,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: ref
          .watch(menuProvider)
          .categoryList
          .map((e) => Padding(
                padding: EdgeInsets.all(spaces.space_100),
                child: Text(e.name),
              ))
          .toList(),
    );
  }
}
