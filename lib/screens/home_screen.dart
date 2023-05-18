import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            const Text('Неавторизованая жопа'),
            ElevatedButton(
              onPressed: () => context.go('/login'),
              child: const Text('Go to Login page'),
            ),
          ],
        ),
      ),
    );
  }
}
