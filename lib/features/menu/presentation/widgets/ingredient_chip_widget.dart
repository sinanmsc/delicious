import 'dart:io';

import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class IngredientChip extends StatelessWidget {
  final String keyWord;
  final String value;
  const IngredientChip({
    super.key,
    required this.keyWord,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(spaces.space_100),
          margin: EdgeInsets.only(bottom: spaces.space_50),
          decoration: BoxDecoration(boxShadow: boxShadow.overlay),
          child: Image.file(
            File(value),
            fit: BoxFit.fill,
            height: spaces.space_600,
            width: spaces.space_600,
          ),
        ),
        Text(
          keyWord,
          style: typography.h500Normal,
        )
      ],
    );
  }
}
