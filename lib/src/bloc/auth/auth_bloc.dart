import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/services/auth_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Login>(_onLogin);
    on<Register>(_onRegister);
    on<Logout>(_onLogout);
  }

  final authService = AuthService();

  dynamic _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await authService.login(event.login, event.password);
      emit(Authenticated(user.user!));
    } on Exception {
      emit(
        AuthError(
          message: 'Не удалось подтвердить вашу личность',
        ),
      );
    }
  }

  dynamic _onRegister(Register event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authService.register(
        event.username,
        event.password,
      );
      emit(Authenticated(user.user!));
    } on Exception {
      emit(
        AuthError(
          message: 'Не удалось зарегистрироваться',
        ),
      );
    }
  }

  dynamic _onLogout(Logout event, Emitter<AuthState> emit) async {
    await authService.logout();
    emit(AuthInitial());
  }

  FutureOr<void> _onExisted(Existed event, Emitter<AuthState> emit) {
    // final user = authService.getCurrentUser();
    // if (user != null) {
    //   emit(Authenticated(user));
    // }

    // emit(AuthInitial());
  }
}
