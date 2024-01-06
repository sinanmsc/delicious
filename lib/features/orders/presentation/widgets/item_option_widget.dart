import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ItemOptionWidget extends StatelessWidget {
  final String text;
  const ItemOptionWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: spaces.space_250, vertical: spaces.space_50),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: colors.txtSubtle),
        borderRadius: BorderRadius.circular(spaces.space_600),
      ),
      child: Text(
        text,
        style: typography.small,
      ),
    );
  }
}
