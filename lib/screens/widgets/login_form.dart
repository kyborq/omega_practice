import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onSubmit,
    this.isLoading = false,
    super.key,
  });

  final void Function(String login, String password) onSubmit;
  final bool isLoading;

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _loginController,
            decoration: const InputDecoration(
              label: Text('Логин:'),
              filled: true,
            ),
            textInputAction: TextInputAction.next,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text('Пароль:'),
              filled: true,
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }
              return null;
            },
          ),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16),
              ),
            ),
            onPressed: !widget.isLoading ? () => _submitForm(context) : null,
            child: widget.isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Войти'),
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final login = _loginController.text;
      final password = _passwordController.text;
      widget.onSubmit(login, password);
    }
  }
}
