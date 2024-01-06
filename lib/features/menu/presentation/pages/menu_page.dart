import 'package:delicious/core/theme/extensions/shadow_extension.dart';
import 'package:delicious/core/theme/extensions/space_extension.dart';
import 'package:delicious/core/theme/extensions/typography_extension.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/widgets/chiplist_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/menu_appbar_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/menu_actionbtn_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/menu_item_container_widget.dart';
import 'package:delicious/features/orders/presentation/widgets/order_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(0, 90),
          child: MenuAppBar(),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(spaces.space_200),
                  child: Column(
                    children: [
                      const OrderTextField(hintText: 'Search Items'),
                      SizedBox(height: spaces.space_300),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_200,
                          vertical: spaces.space_25),
                      itemBuilder: (context, index) =>
                          const MenuItemContainer(),
                      separatorBuilder: (context, index) => SizedBox(
                            height: spaces.space_200,
                          ),
                      itemCount: 5),
                ),
              ],
            ),
            const Text('0')
          ],
        ),
        floatingActionButton: const MenupageActionBtn(),
      ),
    );
  }
}
