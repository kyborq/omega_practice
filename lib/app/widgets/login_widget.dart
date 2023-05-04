import 'package:flutter/material.dart';

import 'custom_text_button.dart';
import 'custom_text_field.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          CustomTextField(
              controller: _loginController,
              labelText: 'Имя пользователя',
              textInputAction: TextInputAction.next),
          const SizedBox(height: 16),
          CustomTextField(
              controller: _passwordController,
              labelText: 'Пароль',
              textInputAction: TextInputAction.done,
              obscureText: true),
          const Spacer(flex: 1),
          CustomTextButton(
            text: 'Войти',
            onPressed: () => {
              if (_formKey.currentState!.validate())
                {
                  // ignore: avoid_print
                  print("Успешный успех во входе!")
                }
            },
          ),
        ]));
  }
}
