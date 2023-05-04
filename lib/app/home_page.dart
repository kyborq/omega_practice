import 'package:flutter/material.dart';
import 'package:omega_practice/app/widgets/login_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Вход'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.blueGrey[50],
        ),
        body: const LoginWidget());
  }
}
