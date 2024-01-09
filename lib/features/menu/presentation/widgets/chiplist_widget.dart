import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ChipList extends StatelessWidget {
  final String labelText;
  const ChipList({
    super.key,required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    return Wrap(
      spacing: spaces.space_100,
      runSpacing: spaces.space_100,
      children: [
        for (int i = 0; i < 3; i++)
          Chip(
            label:  Text(labelText),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(spaces.space_100),
              side: BorderSide(width: spaces.space_25 * 0.25),
            ),
          )
      ],
    );
  }
}
