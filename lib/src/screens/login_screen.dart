import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/router/app_pages.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              content: Text(state.message),
            ),
          );
        }

        if (state is Authenticated) {
          // ignore: avoid_print
          print('********yoyooy');
          context.go(AppPages.home.toPath);
        }

        if (state is AuthInitial) {
          BlocProvider.of<AuthBloc>(context).add(
            Existed(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Войти'),
          elevation: 4,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                  label: Text('Электронная почта:'),
                  filled: true,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text('Пароль:'),
                  filled: true,
                ),
                obscureText: true,
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('У меня нет профиля'),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        Login(
                          login: _loginController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    icon: const Icon(Icons.login),
                    label: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text('Войти'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
