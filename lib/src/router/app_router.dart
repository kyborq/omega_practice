import 'package:go_router/go_router.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/router/app_pages.dart';
import 'package:omega_practice/src/screens/home_screen.dart';
import 'package:omega_practice/src/screens/image_screen.dart';
import 'package:omega_practice/src/screens/login_screen.dart';
import 'package:omega_practice/src/screens/register_screen.dart';

class AppRouter {
  AppRouter(AuthBloc bloc) : _authBloc = bloc;

  final AuthBloc _authBloc;

  GoRouter get goRouter => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    routes: <GoRoute>[
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
      GoRoute(
        path: '${AppPages.image.toPath}/:url',
        builder: (context, state) {
          final url = state.pathParameters['url'];
          return ImageScreen(url: url!);
        },
      ),
    ],
    redirect: (context, state) {
      final authState = _authBloc.state;

      if (authState is! Authenticated) {
        // return AppPages.login.toPath;
        return null;
      }

      return null;
    },
  );
}
