import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // ...
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppPages.home.toTitle),
        ),
        body: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return Text('Logged in as ${state.user.email}');
                } else {
                  return const Text('Not logged in');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
