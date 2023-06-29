import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatelessWidget {
  LoginForm({required this.onLogin, super.key});

  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  final void Function(String login, String password) onLogin;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
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
              label: Text('Электронная почта:'),
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
              label: Text('Пароль:'),
              filled: true,
            ),
            obscureText: true,
            validator: _validatePassword,
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              FilledButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onLogin(
                      _mailController.text,
                      _passwordController.text,
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text('Войти'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
