import 'package:delicious/core/exceptions/authentication/cannot_login_exception.dart';
import 'package:delicious/features/authantication/data/datasource/firebase_auth_datasource.dart';

class LoginUseCase {
  final FirebaseAuthDatasource datasource;
  LoginUseCase({required this.datasource});
  Future<void> call(String email, String password) async {
    try {
      await datasource.login(email, password);
    } catch (e) {
      throw CannotLoginException();
    }
  }
}
