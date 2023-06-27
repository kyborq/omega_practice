import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/router/app_pages.dart';
import 'package:omega_practice/src/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // if (state is AuthError) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       behavior: SnackBarBehavior.floating,
        //       showCloseIcon: true,
        //       content: Text(state.message),
        //     ),
        //   );
        // }

        if (state is Authenticated) {
          context.go(AppPages.home.toPath);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppPages.register.toTitle),
          elevation: 4,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: RegisterForm(
            onRegister: (login, password) {
              BlocProvider.of<AuthBloc>(context).add(
                Register(
                  username: login,
                  password: password,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
