import 'package:delicious/core/exceptions/base_exception.dart';
import 'package:delicious/features/authantication/data/datasource/firebase_auth_datasource.dart';
import 'package:delicious/features/authantication/data/datasource/firebase_auth_datasource_impl.dart';
import 'package:delicious/features/authantication/domain/usecase/login_usecase.dart';
import 'package:delicious/features/authantication/presentation/provider/login_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FirebaseAuthDatasource datasource;
  @override
  LoginState build() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    datasource = ref.watch(firebaseAuthDatasourceProvider);
    return LoginState(showPassword: false, isLoading: false);
  }

  void showPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void isLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }

  Future<String?> login() async {
    try {
      await LoginUseCase(datasource: datasource)(
          emailController.text, passwordController.text);
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}
