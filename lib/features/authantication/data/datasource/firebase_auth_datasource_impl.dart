import 'package:delicious/features/authantication/data/datasource/firebase_auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_datasource_impl.g.dart';

class FirebaseAuthDatasourceImpl implements FirebaseAuthDatasource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // @override
  // Stream<User?> authStateChange() => auth.authStateChanges();

  @override
  Future<UserCredential> login(String email, String password)async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}

@riverpod
FirebaseAuthDatasource firebaseAuthDatasource(FirebaseAuthDatasourceRef ref) {
  return FirebaseAuthDatasourceImpl();
}
