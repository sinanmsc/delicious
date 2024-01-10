import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddBtn extends ConsumerWidget {
  final String text;
  const AddBtn({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.btnPrimary,
        minimumSize: Size(double.infinity, spaces.space_500),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
