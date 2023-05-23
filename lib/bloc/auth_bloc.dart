import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuth? auth)
      : _auth = auth ?? FirebaseAuth.instance,
        super(UnInitialized()) {
    on<AppStarted>(_appStarted);
    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);
  }

  final FirebaseAuth _auth;

  Future<void> _appStarted(
    AppStarted event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: ...
  }

  Future<void> _onAuthenticationUserChanged(
    AuthenticationUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: ...
  }
}
