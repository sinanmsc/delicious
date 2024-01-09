import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/widgets/chiplist_widget.dart';
import 'package:flutter/material.dart';

class MenuItemContainer extends StatelessWidget {
  const MenuItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final boxShadow = AppTheme.of(context).boxShadow;
    final typography = AppTheme.of(context).typography;
    return Container(
      padding: EdgeInsets.all(spaces.space_150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spaces.space_100),
        boxShadow: boxShadow.overlay,
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage('asset/order_images/order1.png'),
            radius: spaces.space_400,
          ),
          SizedBox(width: spaces.space_200),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chicken Biriyani',
                  style: typography.orderCustomervalue,
                ),
                SizedBox(height: spaces.space_100),
                const Text('Variants'),
                const ChipList(labelText: 'Half'),
                SizedBox(height: spaces.space_100),
                const Text('Add-ons'),
                const ChipList(labelText: 'Pickle'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
