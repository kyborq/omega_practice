part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {
  const AuthStarted({
    required this.email,
    required this.password,
    required this.user,
  });

  final String email;
  final String password;
  final User user;

  @override
  List<Object> get props => [email, password, user];
}
