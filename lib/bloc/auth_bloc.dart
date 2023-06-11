import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/services/auth_service.dart';

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
      final user = await authService.loginWithEmail(
        email: event.login,
        password: event.password,
      );
      emit(Authenticated(user));
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
      final user = await authService.registerWithEmail(
        email: event.username,
        password: event.password,
      );
      emit(Authenticated(user));
    } on Exception {
      emit(
        AuthError(
          message: 'Не удалось зарегистрироваться',
        ),
      );
    }
  }

  dynamic _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthInitial());
  }
}
