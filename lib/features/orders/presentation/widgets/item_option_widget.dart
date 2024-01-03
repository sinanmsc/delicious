import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ItemOptionWidget extends StatelessWidget {
  const ItemOptionWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: spaces.space_250,
          vertical: spaces.space_50),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(spaces.space_600),
      ),
      child: Text(
        'Half',
        style: typography.small,
      ),
    );
  }
}