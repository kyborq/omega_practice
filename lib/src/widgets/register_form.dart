import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({required this.onRegister, super.key});

  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final void Function(String login, String password) onRegister;

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

  String? _validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }

    if (value != _passwordController.text) {
      return 'Пароли не совпадают';
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
            decoration: const InputDecoration(
              label: Text('Электронная почта:'),
              filled: true,
            ),
            validator: _validateEmail,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text('Пароль:'),
              filled: true,
            ),
            obscureText: true,
            validator: _validatePassword,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _repeatPasswordController,
            decoration: const InputDecoration(
              label: Text('Повторите пароль:'),
              filled: true,
            ),
            obscureText: true,
            validator: _validateRepeatPassword,
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onRegister(
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
