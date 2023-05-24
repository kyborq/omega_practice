import 'package:go_router/go_router.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/router/app_pages.dart';
import 'package:omega_practice/screens/home_screen.dart';
import 'package:omega_practice/screens/login_screen.dart';
import 'package:omega_practice/screens/register_screen.dart';
import 'package:omega_practice/screens/splash_screen.dart';

class AppRouter {
  final AuthBloc _authBloc = AuthBloc();

  GoRouter get goRouter => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: AppPages.splash.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPages.splash.toPath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPages.login.toPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPages.register.toPath,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppPages.home.toPath,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      final authState = _authBloc.state;

      if (authState is AuthInitial &&
          (state.location != AppPages.splash.toPath &&
              state.location != AppPages.login.toPath &&
              state.location != AppPages.register.toPath)) {
        return AppPages.splash.toPath;
      }

      // Why if Authenticated redirect only on home, when I also have other screens... Damn...
      // if (authState is Authenticated &&
      //     state.location != AppPages.home.toPath) {
      //   return AppPages.home.toPath;
      // }

      return null;
    },
  );
}
