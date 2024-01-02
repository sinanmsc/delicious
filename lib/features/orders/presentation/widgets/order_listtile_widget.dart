import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/orders/presentation/pages/order_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderListTile extends StatelessWidget {
  // final void Function()? onTap;
  const OrderListTile({
    super.key,
    // required this.onTap,/
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    const id = '#14554';

    return ListTile(
      onTap: () => context.push(OrderDetails.path,extra: id),
      tileColor: colors.backgroundLight,
      shape: ContinuousRectangleBorder(
        side: const BorderSide(width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(spaces.space_250),
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: colors.primary,
        child: const Icon(Icons.person),
      ),
      title: Text(
        'Mohammed Sinan C',
        style: typography.h600,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Count: 4',
            style: typography.uiSemibold,
          ),
          Text(
            'id: $id',
            style: typography.ui,
          ),
        ],
      ),
      trailing: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 20,
            child: CircleAvatar(
              backgroundColor: colors.imgBack,
              radius: 20,
            ),
          ),
          const Positioned(
            left: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('asset/order_images/food2.png'),
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('asset/order_images/food1.png'),
          ),
        ],
      ),
    );
  }
}
