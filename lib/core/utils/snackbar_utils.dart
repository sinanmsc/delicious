import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarWhenClickBtn(
    BuildContext context, String errorMsg) {
  final colors = AppTheme.of(context).colors;
  final typography = AppTheme.of(context).typography;
  final spaces = AppTheme.of(context).spaces;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMsg,
        style: typography.smallHead,
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(spaces.space_500),
      backgroundColor: colors.backgroundLight,
      shape: const StadiumBorder(),
    ),
  );
}
