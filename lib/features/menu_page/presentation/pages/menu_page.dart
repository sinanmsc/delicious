import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu_page/presentation/widgets/menubar_widget.dart';
import 'package:delicious/features/menu_page/presentation/widgets/menupae_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuPage extends HookConsumerWidget {
  const MenuPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: MenupageActionBtn(theme: theme),
        appBar: AppBar(
          title: Text(
            "menu",
            style: theme.typography.appbarTitle,
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, theme.spaces.space_400),
              child: const MenuPageBar()),
        ),
      ),
    );
  }
}
