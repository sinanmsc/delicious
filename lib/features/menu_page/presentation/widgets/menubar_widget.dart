import 'package:flutter/material.dart';

import '../../../../core/theme/theme_helper.dart';

class MenuPageBar extends StatelessWidget {
  const MenuPageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = AppTheme.of(context);

    return TabBar(
        onTap: (value) {},
        padding: EdgeInsets.zero,
        labelColor: theme.colors.primary,
        unselectedLabelColor: Colors.black45,
        indicatorColor: theme.colors.primary,
        labelStyle: theme.typography.h300,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(
            text: "mandi",
          ),
          Tab(
            text: "mandi",
          ),
        ]);
  }
}
