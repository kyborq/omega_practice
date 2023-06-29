import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/router/app_pages.dart';
import 'package:omega_practice/src/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPages.register.toTitle),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: RegisterForm(
          onRegister: (login, password) {
            BlocProvider.of<AuthBloc>(context).add(
              RegisterUser(
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
