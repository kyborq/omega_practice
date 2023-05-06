import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:omega_practice/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    void handleHome() {
      context.go('/');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Добро пожаловать!')),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Электронная почта'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Пароль'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                final user = await authService.signIn(
                  'k.podyganov@mail.ru',
                  '12345678',
                );

                if (user != null) {
                  // ignore: avoid_print
                  print('YAY!!!!');
                  // context.go('/')
                  handleHome();
                  // GoRouter.of(context).go('/dashboard');
                } else {
                  // print('NOT YAY :(((');
                  // обработать ошибку аутентификации
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
