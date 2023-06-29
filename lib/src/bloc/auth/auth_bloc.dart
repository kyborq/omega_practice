import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/services/auth_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginUser>(_onLogin);
    on<RegisterUser>(_onRegister);
    on<LogoutUser>(_onLogout);
    on<CheckUser>(_onCheckAuth);
  }

  final authService = AuthService();

  dynamic _onLogin(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await authService.login(event.email, event.password);
      emit(Authenticated(user.user!));
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.message?.split('] ').last ?? e.message;
      emit(AuthError(message: errorMessage!));
    }
  }

  dynamic _onRegister(RegisterUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authService.register(
        event.email,
        event.password,
      );
      emit(Authenticated(user.user!));
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.message?.split('] ').last ?? e.message;
      emit(AuthError(message: errorMessage!));
    }
  }

  dynamic _onLogout(LogoutUser event, Emitter<AuthState> emit) async {
    await authService.logout();
    emit(AuthInitial());
  }

  FutureOr<void> _onCheckAuth(CheckUser event, Emitter<AuthState> emit) {
    final user = authService.getCurrentUser();
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(AuthInitial());
    }
  }
}
