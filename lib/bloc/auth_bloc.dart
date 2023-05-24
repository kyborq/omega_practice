import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuth? auth)
      : _auth = auth ?? FirebaseAuth.instance,
        super(AuthInitial()) {
    on<Login>(_onLogin);
    on<Register>(_onRegister);
    on<Logout>(_onLogout);
  }

  final FirebaseAuth _auth;

  dynamic _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
  }

  dynamic _onRegister(Register event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
  }

  dynamic _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthInitial());
  }
}
