import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  final String hintText;
  final String? headText;
  final Widget? prifixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.headText,
    this.prifixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        headText != null
            ? Padding(
                padding: EdgeInsets.only(bottom: spaces.space_100),
                child: Text(
                  headText!,
                  style: typography.smallHead,
                ),
              )
            : const SizedBox(),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prifixIcon,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: spaces.space_200),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: BorderSide(width: 1, color: colors.btnPrimary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: const BorderSide(width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: const BorderSide(width: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
