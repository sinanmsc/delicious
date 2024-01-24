import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDatasource {
  // Stream<User?> authStateChange();
  Future<UserCredential> login(String email, String password);
}
