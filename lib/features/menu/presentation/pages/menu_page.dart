import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/pages/view_dish_page.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/menu_appbar_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/menu_actionbtn_widget.dart';
import 'package:delicious/features/menu/presentation/widgets/menu_item_container_widget.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;

    ref.read(menuProvider.notifier).getCategories();

    return DefaultTabController(
      length: ref.watch(menuProvider).categoryList.length,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(0, 90),
          child: MenuAppBar(),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (var i in ref.watch(menuProvider).categoryList)
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(spaces.space_200),
                    child: const Column(
                      children: [
                        CustomTextField(
                          hintText: 'Search Items',
                          prifixIcon: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_200,
                          vertical: spaces.space_25),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => context.push(ViewDish.routerPath),
                        child: const MenuItemContainer(),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: spaces.space_200),
                    ),
                  ),
                ],
              ),
          ],
        ),
        floatingActionButton: const MenupageActionBtn(),
      ),
    );
  }
}
