import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/router/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добро пожаловать!'),
      ),
      body: Column(
        children: [
          const Text('Войдите в аккаунт или создайте новый'),
          ElevatedButton(
            onPressed: () {
              context.go(AppPages.login.toPath);
            },
            child: const Text('Есть аккаунт'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(AppPages.register.toPath);
            },
            child: const Text('Создать новый'),
          ),
        ],
      ),
    );
  }
}
