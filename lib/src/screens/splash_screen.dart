import 'package:flutter/material.dart';
import 'package:omega_practice/src/router/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPages.splash.toTitle),
      ),
      body: Column(),
    );
  }
}
