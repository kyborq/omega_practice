import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';
import 'package:omega_practice/screens/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          context.go(AppPages.splash.toPath);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppPages.home.toTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  Logout(),
                );
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              UserCard(),
            ],
          ),
        ),
      ),
    );
  }
}
