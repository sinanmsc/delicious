import 'package:delicious/core/constants/settings/settings_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DarkThemeWidgets extends ConsumerWidget {
  const DarkThemeWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final Colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    // final themeprovider=ref.watch(themee)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ref.watch(settingsConstantsProvider).txtDarktheme,
          style: typography.h600,
        ),
        ToggleSwitch(
          minWidth: spaces.space_600,
          minHeight: spaces.space_500,
          initialLabelIndex: 0,
          cornerRadius: spaces.space_100,
          activeFgColor: Colors.btnPrimary,
          inactiveBgColor: Colors.primary,
          inactiveFgColor: Colors.backgroundLight,
          totalSwitches: 2,
          icons: const [
            Icons.lightbulb,
            Icons.dark_mode,
          ],

          changeOnTap: true,
          iconSize: spaces.space_200,
          activeBgColors: [
            [Colors.btnPrimary, Colors.backgroundLight],
            [Colors.container, Colors.txtInverse]
          ],
          animate:
              true, // with just animate set to true, default curve = Curves.easeIn
          curve: Curves
              .bounceInOut, // animate must be set to true when using custom curve
          onToggle: (index) {
            ref.read(settingsProvider.notifier).switchtheme(index!);
            print('switched to: $index');
          },
        ),
      ],
    );
  }
}
