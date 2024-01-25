import 'package:delicious/core/constants/settings/settings_constants.dart';
// import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutWidget extends ConsumerWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final Colors = AppTheme.of(context).colors;
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: StadiumBorder(),
        ),
        onPressed: () {},
        child: Text(
          ref.watch(settingsConstantsProvider).txtLogoutbutton,
          // style: TextStyle(color: Colors.txtInverse),
        ),
      ),
    );
  }
}
