import 'package:flutter/material.dart';
import 'package:omega_practice/router/app_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppPages.home.toTitle)),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // ...
            },
            child: const Text('Hello world!2'),
          ),
        ),
      ),
    );
  }
}
