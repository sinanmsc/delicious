import 'package:delicious/core/constants/order/order_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/orders/presentation/widgets/item_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemContainer extends ConsumerWidget {
  const ItemContainer({
    super.key,
  });


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final boxShadow = AppTheme.of(context).boxShadow;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: spaces.space_100, vertical: spaces.space_200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spaces.space_100),
        boxShadow: boxShadow.overlay,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage:
                AssetImage('asset/order_images/order1.png'),
          ),
          SizedBox(width: spaces.space_250),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Item Name',
                style: typography.h500Normal,
              ),
              Text(
                '10 ${ref.watch(orderConstantsProvider).txtQuantity}',
                style: typography.small,
              ),
              SizedBox(height: spaces.space_200),
              SizedBox(
                height: 25,
                width: 200,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const ItemOptionWidget(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: 2),
              ),
            ],
          ),
          SizedBox(width: spaces.space_200),
        ],
      ),
    );
  }
}
