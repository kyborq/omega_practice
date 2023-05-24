import 'package:go_router/go_router.dart';
import 'package:omega_practice/router/app_pages.dart';
import 'package:omega_practice/screens/home_screen.dart';
import 'package:omega_practice/screens/login_screen.dart';
import 'package:omega_practice/screens/register_screen.dart';
import 'package:omega_practice/screens/splash_screen.dart';

class AppRouter {
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
  );
}
