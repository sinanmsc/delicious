import 'package:delicious/core/constants/authentication/authentication_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/utils/snackbar_utils.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:delicious/features/Admin_Page/prasentation/pages/admin_main_page.dart';
import 'package:delicious/features/authantication/presentation/provider/login_provider.dart';
import 'package:delicious/features/menu/presentation/widgets/add_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  static const routerPath = '/login';
  static const routerName = 'Login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    onLogin() async {
      ref.read(loginProvider.notifier).isLoading();
      final errorMsg = await ref.read(loginProvider.notifier).login();
      if (errorMsg != null) {
        return Future.sync(() => snackBarWhenClickBtn(context, errorMsg));
      } else {
        Future.sync(() => context.go(AdminMainPage.routerPath));
      }
      ref.read(loginProvider.notifier).isLoading();
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(spaces.space_250),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                    'asset/authentication_image/login_illustration_img.jpg'),
              ),
              SizedBox(height: spaces.space_400),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ref.watch(authConstantsProvider).txtEmail,
                      style: typography.smallHead),
                  SizedBox(height: spaces.space_100),
                  CustomTextField(
                    controller:
                        ref.read(loginProvider.notifier).emailController,
                    hintText: ref.watch(authConstantsProvider).txtEmail,
                    prifixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
              SizedBox(height: spaces.space_400),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ref.watch(authConstantsProvider).txtPassword,
                      style: typography.smallHead),
                  SizedBox(height: spaces.space_100),
                  CustomTextField(
                    controller:
                        ref.read(loginProvider.notifier).passwordController,
                    obscureText:
                        ref.watch(loginProvider).showPassword ? true : false,
                    hintText: ref.watch(authConstantsProvider).txtPassword,
                    prifixIcon: IconButton(
                      onPressed: () =>
                          ref.read(loginProvider.notifier).showPassword(),
                      icon: ref.watch(loginProvider).showPassword
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined),
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(spaces.space_300),
        child: AddBtn(
          text: 'Login',
          isLoading: ref.watch(loginProvider).isLoading,
          onPressed: onLogin,
        ),
      ),
    );
  }
}
