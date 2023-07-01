import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omega_practice/src/strings.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({required this.onRegister, super.key});

  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final void Function(String login, String password) onRegister;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return requiredField;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return requiredField;
    }
    return null;
  }

  String? _validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return requiredField;
    }

    if (value != _passwordController.text) {
      return passwordNotMatch;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _mailController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(
              label: Text(emailField),
              filled: true,
            ),
            validator: _validateEmail,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(
              label: Text(passwordField),
              filled: true,
            ),
            obscureText: true,
            validator: _validatePassword,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _repeatPasswordController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(
              label: Text(repeatPasswordField),
              filled: true,
            ),
            obscureText: true,
            validator: _validateRepeatPassword,
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              FilledButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onRegister(
                      _mailController.text,
                      _passwordController.text,
                    );
                  }
                },
                icon: const Icon(Icons.key),
                label: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(registerButton),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
