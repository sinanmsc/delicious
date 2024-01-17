import 'package:delicious/features/menu/presentation/pages/add_category_page.dart';
import 'package:delicious/features/menu/presentation/pages/add_dishes_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../../../core/theme/theme_helper.dart';

class MenupageActionBtn extends StatelessWidget {
  const MenupageActionBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return SpeedDial(
      closedForegroundColor: Colors.black,
      openForegroundColor: Colors.white,
      closedBackgroundColor: colors.primary,
      openBackgroundColor: colors.imgBack,
      labelsStyle: typography.h400,
      labelsBackgroundColor: Colors.white,
      // controller: actionBtnController,
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: const Icon(Icons.add_box_rounded),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          label: 'Add category!',
          onPressed: () => context.push(AddCategory.routerPath),
          // closeSpeedDialOnPressed: false,
        ),
        SpeedDialChild(
          child: const Icon(Icons.add_circle),
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          label: 'Add dish !',
          onPressed: () => context.push(AddDishes.routerPath),
        ),
        //  Your other SpeedDialChildren go here.
      ],
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
