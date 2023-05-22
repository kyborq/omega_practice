import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  User? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return user;
    }
    return null;
  }

  Future<User> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final credentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credentials.user!;
  }

  Future<User> registerWithEmail({
    required String email,
    required String password,
  }) async {
    final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credentials.user!;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
