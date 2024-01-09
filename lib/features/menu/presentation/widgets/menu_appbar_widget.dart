import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/widgets/menubar_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuAppBar extends ConsumerWidget {
  const MenuAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final theme = AppTheme.of(context);
    return AppBar(
      actionsIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: colors.btnPrimary,
      title: Text(
        ref.watch(menuConstantsProvider).txtMenuAppbarTitle,
        style: theme.typography.appbarTitle,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ],
      bottom: PreferredSize(
          preferredSize: Size(double.infinity, theme.spaces.space_400),
          child: const MenuPageBar()),
    );
  }
}
