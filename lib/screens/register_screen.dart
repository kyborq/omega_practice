import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';
import 'package:omega_practice/screens/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            title: Text(AppPages.register.toTitle),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: RegisterForm(
              isLoading: _authState is AuthLoading,
              onSubmit: (login, password) {
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
      ),
    );
  }
}
