import 'package:flutter/material.dart';

import '../../../../core/theme/theme_helper.dart';

class MenuPageBar extends StatelessWidget {
  const MenuPageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var typography = AppTheme.of(context).typography;

    return TabBar(
        isScrollable: true,
        onTap: (value) {},
        padding: EdgeInsets.zero,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorColor: Colors.white,
        labelStyle: typography.h400Invers,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(
            text: 'Biriyani',
          ),
          Tab(
            text: 'Mandhi',
          ),
          Tab(
            text: 'Biriyani',
          ),
          Tab(
            text: 'Mandhi',
          ),
          Tab(
            text: 'Biriyani',
          ),
          Tab(
            text: 'Mandhi',
          ),
        ]);
  }
}
