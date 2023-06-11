import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.onSubmit,
    this.isLoading = false,
    super.key,
  });

  final void Function(String email, String password) onSubmit;
  final bool isLoading;

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(
              label: Text('Электронная почта:'),
              filled: true,
            ),
            textInputAction: TextInputAction.next,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }

              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Неверный формат email';
              }

              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(
              label: Text('Пароль:'),
              filled: true,
            ),
            // TODO: Change later to show/hide button
            // obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }

              final validCharacters = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
              );
              if (!validCharacters.hasMatch(value)) {
                return 'Пароль слаб духом';
              }

              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _repPasswordController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: const InputDecoration(
              label: Text('Повторите пароль:'),
              filled: true,
            ),
            // TODO: Change later to show/hide button
            // obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }
              if (value != _passwordController.text) {
                return 'Пароли не совпадают';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                : const Text('Зарегистрироваться'),
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final login = _emailController.text;
      final password = _passwordController.text;
      widget.onSubmit(login, password);
    }
  }
}
