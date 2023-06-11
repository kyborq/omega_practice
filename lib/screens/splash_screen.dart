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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Войдите в аккаунт или создайте новый',
              style: TextStyle(fontSize: 32),
            ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16),
                ),
              ),
              onPressed: () async {
                await context.push(AppPages.login.toPath);
              },
              child: const Text('Есть аккаунт'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16),
                ),
              ),
              onPressed: () async {
                await context.push(AppPages.register.toPath);
              },
              child: const Text('Создать новый'),
            ),
          ],
        ),
      ),
    );
  }
}
