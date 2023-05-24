part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {}

class Logout extends AuthEvent {}

class Register extends AuthEvent {
  Register({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}
