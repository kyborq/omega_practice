import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/router/app_pages.dart';
import 'package:omega_practice/src/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPages.login.toTitle),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: LoginForm(
          onLogin: (login, password) {
            BlocProvider.of<AuthBloc>(context).add(
              LoginUser(
                email: login,
                password: password,
              ),
            );
          },
        ),
      ),
    );
  }
}
