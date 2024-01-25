import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ChangeContainer extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ChangeContainer({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: space.space_150),
        width: space.space_600 * 8,
        height: space.space_400 * 2,
        decoration: BoxDecoration(
          boxShadow: boxShadow.overlay,
        ),
        child: Row(
          children: [
            Center(
              child: Text(
                text,
                style: typography.uiSemibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
