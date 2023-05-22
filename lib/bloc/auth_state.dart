part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  const AuthSuccess(
    this.user,
  );

  final User user;
}

class AuthFailure extends AuthState {
  const AuthFailure(
    this.error,
  );

  final String error;
}
