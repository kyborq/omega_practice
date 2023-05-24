import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/router/app_pages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPages.login.toTitle),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // context.go(AppPages.register.toPath);
            },
            child: const Text('Войти'),
          ),
        ],
      ),
    );
  }
}
