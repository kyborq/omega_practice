import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          // TODO: Do something with progress state
        }

        if (state is Authenticated) {
          context.go(AppPages.home.toPath);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppPages.register.toTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                label: Text('Логин:'),
                filled: true,
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('Пароль:'),
                filled: true,
              ),
              obscureText: true,
            ),
            TextField(
              controller: _repeatPasswordController,
              decoration: const InputDecoration(
                label: Text('Повторите пароль:'),
                filled: true,
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  Register(
                    username: _loginController.text,
                    password: _passwordController.text,
                  ),
                );
              },
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
