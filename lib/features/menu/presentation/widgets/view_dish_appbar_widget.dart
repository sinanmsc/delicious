import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/pages/add_dishes_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewDishAppBar extends StatelessWidget {
  const ViewDishAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return AppBar(
      backgroundColor: colors.btnPrimary,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        'Title',
        style: typography.appbarTitle,
      ),
      actions: [
        IconButton(
            onPressed: () => context.push(AddDishes.routerPath),
            icon: const Icon(
              Icons.edit,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline_sharp,
            ))
      ],
    );
  }
}
