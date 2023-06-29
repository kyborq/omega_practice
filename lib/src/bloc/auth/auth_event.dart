part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckUser extends AuthEvent {}

class LoginUser extends AuthEvent {
  LoginUser({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class LogoutUser extends AuthEvent {}

class RegisterUser extends AuthEvent {
  RegisterUser({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class Existed extends AuthEvent {}
