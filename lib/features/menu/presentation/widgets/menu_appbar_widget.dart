import 'package:delicious/core/constants/menu/menu_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/menubar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuAppBar extends ConsumerWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    void removeCategory() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Are you sure delete category'),
          actions: [
            TextButton(onPressed: () => context.pop(), child: const Text('No')),
            TextButton(
                onPressed: () async {
                  await ref.read(menuProvider.notifier).removeCategory();
                  Future.sync(() => context.pop());
                },
                child:
                    //  !ref.watch(menuProvider).isLoading
                    //     ?
                    SizedBox(
                  width: spaces.space_200,
                  height: spaces.space_200,
                  child: CircularProgressIndicator(
                    // color: colors.txtInverse,
                    strokeWidth: 2,
                  ),
                )
                // : const Text('Yes'),
                )
          ],
        ),
      );
    }

    return AppBar(
      actionsIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: colors.btnPrimary,
      title: Text(
        ref.watch(menuConstantsProvider).txtMenuAppbarTitle,
        style: typography.appbarTitle,
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: removeCategory,
              child: const Text('Delete Category'),
            ),
            const PopupMenuItem(child: Text('Update Category')),
          ],
        )
      ],
      bottom: PreferredSize(
          preferredSize: Size(double.infinity, spaces.space_400),
          child: const MenuPageBar()),
    );
  }
}
