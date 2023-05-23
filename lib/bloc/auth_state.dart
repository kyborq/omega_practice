part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class UnInitialized extends AuthState {}

class NotAuth extends AuthState {}

class Authenticated extends AuthState {}
