// import 'package:go_router/go_router.dart';
// import 'package:omega_practice/blocs/auth_bloc.dart';
// import 'package:omega_practice/router/app_pages.dart';
// import 'package:omega_practice/screens/home_screen.dart';
// import 'package:omega_practice/screens/login_screen.dart';

// class AppRouter {
//   AppRouter(AuthBloc bloc) : _authBloc = bloc;

//   GoRouter get goRouter => _goRouter;
//   final AuthBloc _authBloc;

//   late final GoRouter _goRouter = GoRouter(
//     refreshListenable: GoRouterRefreshStream(_authBloc.stream),
//     initialLocation: AppPages.home.toPath,
//     routes: <GoRoute>[
//       GoRoute(
//         path: AppPages.home.toPath,
//         builder: (context, state) => const HomeScreen(),
//       ),
//       GoRoute(
//         path: AppPages.auth.toPath,
//         builder: (context, state) => const LoginScreen(),
//       ),
//     ],
//     redirect: (context, state) {},
//     // redirect: ( state) {
//     //     final authState = _authBloc.state;

//     //     if (authState is UnInitialized &&
//     //         state.location != AppPages.splash.toPath) {
//     //       return AppPages.splash.toPath;
//     //     }

//     //     if (authState is NotAuth && state.location != AppPages.signin.toPath) {
//     //       return AppPages.signin.toPath;
//     //     }

//     //     if (authState is Authenticated &&
//     //         state.location != AppPages.home.toPath) {
//     //       return AppPages.home.toPath;
//     //     }

//     //     return null;
//     //   });
//   );
// }
