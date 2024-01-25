import 'package:delicious/core/constants/settings/settings_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/settings/presentation/widgets/Editing_data_widgets.dart';
import 'package:delicious/features/settings/presentation/widgets/Editing_password_widget.dart';
import 'package:delicious/features/settings/presentation/widgets/change_container_widgets.dart';
import 'package:delicious/features/settings/presentation/widgets/dark_theme_widgets.dart';
import 'package:delicious/features/settings/presentation/widgets/logout_button_widgets.dart';
import 'package:delicious/features/settings/presentation/widgets/timeing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  static const routerPath = '/settings_details';
  static const routerName = 'settings_dart';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = TextEditingController();
    final oldpassword = TextEditingController();
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.btnPrimary,
        title: Text(
          ref.watch(settingsConstantsProvider).txtappbar,
          style: typography.appbarTitle,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) =>
                [const PopupMenuItem(child: LogoutWidget())],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spaces.space_150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: spaces.space_900,
                      backgroundColor: colors.behindImage,
                    ),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    Text(
                      'username',
                      style: typography.h600,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: spaces.space_100 * 3,
              ),
              Text(
                ref.watch(settingsConstantsProvider).txtmanage,
                style: typography.smallHead,
              ),
              SizedBox(
                height: spaces.space_100 * 2,
              ),
              ChangeContainer(
                text: ref.watch(settingsConstantsProvider).txtchangeName,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => EditingWidget(
                            controller: name,
                          ));
                },
              ),
              SizedBox(
                height: spaces.space_300,
              ),
              ChangeContainer(
                text: ref.watch(settingsConstantsProvider).txtchangePassword,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditingPassword(
                      newcontroller: oldpassword,
                    ),
                  );
                },
              ),
              SizedBox(
                height: spaces.space_200 * 2,
              ),
              const DarkThemeWidgets(),
              SizedBox(
                height: spaces.space_200 * 2,
              ),
              Text(
                ref.watch(settingsConstantsProvider).txtTiming,
                style: typography.smallHead,
              ),
              const TimingWidgets(),
              SizedBox(
                height: spaces.space_400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
