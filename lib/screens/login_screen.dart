import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          // TODO: Do something with progress state
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppPages.login.toTitle),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Login());
              },
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
