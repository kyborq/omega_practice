import 'package:go_router/go_router.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';
import 'package:omega_practice/screens/home_screen.dart';
import 'package:omega_practice/screens/login_screen.dart';
import 'package:omega_practice/screens/register_screen.dart';

class AppRouter {
  AppRouter(AuthBloc bloc) : _authBloc = bloc;

  GoRouter get goRouter => _goRouter;
  final AuthBloc _authBloc;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: AppPages.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPages.home.toPath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppPages.login.toPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPages.register.toPath,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    redirect: (context, state) {
      final authState = _authBloc.state;

      if (authState is AuthInitial && state.location != AppPages.login.toPath) {
        return AppPages.login.toPath;
      }

      return null;
    },
  );
}
