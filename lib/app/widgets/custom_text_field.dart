import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputAction textInputAction;
  final bool obscureText;
  // final FormFieldValidator<String>? validator;
  final void Function(String)? onFieldSubmitted;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.textInputAction,
    this.obscureText = false,
    // this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Поле не должно быть пустым';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        labelText: labelText,
      ),
    );
  }
}
