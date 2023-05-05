import 'package:flutter/material.dart';
import 'package:omega_practice/app/authentication.dart';

class RegisterScreen extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  const RegisterScreen(
      {super.key, required this.auth, required this.onSignedIn});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Регистрация"),
        ),
        body: Container(child: null));
  }
}
