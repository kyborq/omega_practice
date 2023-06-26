import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> register(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<UserCredential> login(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    final currentUser = _auth.currentUser;
    return currentUser;
  }
}
