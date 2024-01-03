import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/orders/presentation/pages/order_details_page.dart';
import 'package:delicious/features/orders/presentation/widgets/stacked_foods_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;

    return InkWell(
      onTap: () => context.push(OrderDetails.path, extra: '#1455'),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: spaces.space_300, vertical: spaces.space_200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(spaces.space_100),
          boxShadow: boxShadow.overlay,
        ),
        child: Row(
          children: [
            StackedFoodImages(
              radius: spaces.space_250,
              firstPosition: spaces.space_125,
              secondPosition: spaces.space_250,
            ),
            SizedBox(width: spaces.space_400),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mohammed Sinan C', style: typography.h500),
                Text('4 Items', style: typography.smallSemibold),
                Text('id: #1455', style: typography.small),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
