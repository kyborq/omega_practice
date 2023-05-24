part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class AuthError extends AuthState {
  AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
