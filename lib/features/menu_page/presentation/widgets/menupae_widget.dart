import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../../../core/theme/theme_helper.dart';

class MenupageActionBtn extends StatelessWidget {
  const MenupageActionBtn({
    super.key,
    required this.theme,
  });

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      closedForegroundColor: Colors.black,
      openForegroundColor: Colors.white,
      closedBackgroundColor: theme.colors.primary,
      openBackgroundColor: theme.colors.imgBack,
      labelsStyle: theme.typography.h400,
      labelsBackgroundColor: Colors.white,
      // controller: actionBtnController,
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: const Icon(Icons.add_box_rounded),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          label: 'Add category!',
          onPressed: () {},
          // closeSpeedDialOnPressed: false,
        ),
        SpeedDialChild(
          child: const Icon(Icons.add_circle),
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          label: 'Add dish !',
          onPressed: () {},
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
