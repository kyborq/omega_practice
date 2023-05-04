import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Size minimumSize;
  final RoundedRectangleBorder shape;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blueAccent,
    this.foregroundColor = Colors.white,
    this.minimumSize = const Size(double.infinity, 54),
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
        minimumSize: MaterialStateProperty.all<Size>(minimumSize),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(shape),
      ),
      child: Text(text),
    );
  }
}
