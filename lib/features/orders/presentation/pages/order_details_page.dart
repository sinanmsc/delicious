import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  static const path = '/order_details';
  static const name = 'order_details';
  final String id;
  const OrderDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.btnPrimary,
        title: Text(
          id,
          style: typography.appbarTitle,
        ),
      ),
    );
  }
}
