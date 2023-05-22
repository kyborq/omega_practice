import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required FirebaseAuth auth})
      : _auth = auth,
        super(AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
  }

  final FirebaseAuth _auth;

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final user = event.user;
    emit(AuthSuccess(user));
  }
}
