import 'package:delicious/core/theme/color_palette/color_palette.dart';
import 'package:delicious/core/theme/extensions/colors_extension.dart';
import 'package:delicious/core/theme/extensions/shadow_extension.dart';
import 'package:delicious/core/theme/extensions/space_extension.dart';
import 'package:delicious/core/theme/extensions/typography_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_theme.g.dart';

ThemeData _darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColorPalette.redLight,
  colorScheme: const ColorScheme.dark(),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.black,
    surfaceTintColor: Colors.black,
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppColors(
      primary: AppColorPalette.redLight,
      btnPrimary: AppColorPalette.red,
      txtInverse: Colors.white,
      imgBack: Colors.orange[800]!,
      txtSubtle: Colors.grey[400]!,
      backgroundLight: Colors.grey[900]!,
      behindImage: Colors.grey[800]!,
      container: Colors.grey[700]!,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: Colors.grey[200]!,
      linkColor: Colors.blueAccent,
      dimFontColor: Colors.grey[400]!,
    ),
    AppBoxShadow(
      overlay: [
        const BoxShadow(
          blurRadius: 1,
          color: Color(0x1F091E42),
          blurStyle: BlurStyle.outer,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
        const BoxShadow(
          blurRadius: 8,
          color: Color.fromARGB(55, 193, 192, 192),
          blurStyle: BlurStyle.outer,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
      ],
    ),
  ],
);

@riverpod
ThemeData appDarkTheme(AppDarkThemeRef ref) {
  return _darkTheme;
}
