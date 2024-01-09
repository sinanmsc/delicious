import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class CustomerDetailText extends StatelessWidget {
  final String head;
  final String value;
  const CustomerDetailText(
      {super.key, required this.head, required this.value});

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: typography.smallHead,
        ),
        SizedBox(height: spaces.space_50),
        Text(
          value,
          style: typography.orderCustomervalue,
        ),
      ],
    );
  }
}
