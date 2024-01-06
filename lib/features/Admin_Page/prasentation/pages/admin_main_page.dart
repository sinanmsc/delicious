import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminMainPage extends HookConsumerWidget {
  static const pagepath = '/';
  static const pagename = 'AdminPage';

  const AdminMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nav = useState(0);
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.txtInverse,
      body: MenuPage(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: nav.value,
          onTap: (value) {
            nav.value = value;
          },
          selectedItemColor: AppTheme.of(context).colors.primary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_list),
                activeIcon: Icon(CupertinoIcons.square_list_fill),
                label: 'Menu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart_outlined),
                activeIcon: Icon(Icons.table_chart_rounded),
                label: 'Offer'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
