import 'package:delicious/core/theme/color_palette/color_palette.dart';
import 'package:delicious/core/theme/extensions/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColorPalette.redLight,
  colorScheme: const ColorScheme.light(),
  extensions: <ThemeExtension<dynamic>>[
    AppColors(
      primary: AppColorPalette.redLight,
      btnPrimary: AppColorPalette.red,
      txtInverse: Colors.white,
      imgBack: AppColorPalette.orangeLight,
      txtSubtle: AppColorPalette.black_240,
    ),
  ],
);

@riverpod
ThemeData appTheme(AppThemeRef ref) {
  return _lightTheme;
}
