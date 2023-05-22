import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      return user;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      return user;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }

  Future<User?> logOut(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      return user;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
