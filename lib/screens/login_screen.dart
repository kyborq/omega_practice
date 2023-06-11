import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';
import 'package:omega_practice/screens/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthState _authState = AuthInitial();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              content: Text(state.message),
            ),
          );
        }
        if (state is Authenticated) {
          context.go(AppPages.home.toPath);
        }
        setState(() {
          _authState = state;
        });
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppPages.login.toTitle),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: LoginForm(
              isLoading: _authState is AuthLoading,
              onSubmit: (login, password) {
                BlocProvider.of<AuthBloc>(context).add(
                  Login(
                    login: login,
                    password: password,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
