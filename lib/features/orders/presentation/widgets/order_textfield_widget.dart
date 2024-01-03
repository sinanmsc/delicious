import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class OrderTextField extends StatelessWidget {
  const OrderTextField({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;

    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        label: const Text('Search'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spaces.space_125),
          borderSide: const BorderSide(width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spaces.space_125),
          borderSide: const BorderSide(width: 0.5),
        ),
      ),
    );
  }
}
