import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddBtn extends ConsumerWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  const AddBtn({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.btnPrimary,
        minimumSize: Size(double.infinity, spaces.space_500),
      ),
      child: isLoading
          ? SizedBox(
              width: spaces.space_200,
              height: spaces.space_200,
              child: CircularProgressIndicator(
                color: colors.txtInverse,
                strokeWidth: 2,
              ),
            )
          : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
