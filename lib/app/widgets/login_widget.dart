import 'package:flutter/material.dart';

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
        child: Column(children: [
          TextFormField(
            controller: _loginController,
            textInputAction: TextInputAction.next,
            // onEditingComplete: () => FocusScope.of(context).nextFocus(),
            onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(FocusNode());
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }
              return null;
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              labelText: 'Имя пользователя',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            // style: ,
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            // onEditingComplete: () => FocusScope.of(context).unfocus(),
            // onFieldSubmitted: (_) {
            //   if (_formKey.currentState!.validate()) {
            //     // Form is valid, do something
            //   }
            // },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым';
              }
              return null;
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              labelText: 'Пароль',
            ),
            obscureText: true,
          ),
          const Spacer(flex: 1),
          TextButton(
            onPressed: () => {
              if (_formKey.currentState!.validate())
                {
                  // Form is valid, do something
                  print('Form is valid!!!!!')
                }
              // ...
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueAccent),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 54)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: const Text('Войти'),
          ),
        ]));
  }
}
