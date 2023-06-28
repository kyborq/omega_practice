import 'package:go_router/go_router.dart';
import 'package:omega_practice/src/router/app_pages.dart';
import 'package:omega_practice/src/screens/splash_screen.dart';

class AppRouter {
  GoRouter get goRouter => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppPages.splash.toPath,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
