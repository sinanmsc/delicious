import 'package:delicious/core/constants/order_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/orders/presentation/widgets/order_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPage extends ConsumerWidget {
  static const routerPath = '/order';
  static const routerName = 'Order';

  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.btnPrimary,
        title: Text(
          ref.watch(orderConstantsProvider).txtAppbarTitle,
          style: typography.appbarTitle,
        ),
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: spaces.space_100,
          ),
          padding: EdgeInsets.all(spaces.space_100),
          itemCount: 12,
          itemBuilder: (context, index) {
            return const OrderListTile();
          },
        ),
      ),
    );
  }
}
