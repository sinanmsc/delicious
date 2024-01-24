import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_constants.g.dart';

class AuthConstants {
  final txtEmail = 'Email';
  final txtPassword = 'Password';
}

@riverpod
AuthConstants authConstants(AuthConstantsRef ref) {
  return AuthConstants();
}
