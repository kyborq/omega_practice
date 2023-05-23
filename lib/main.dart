import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';
import 'package:omega_practice/firebase_options.dart';
import 'package:omega_practice/router/app_router.dart';
import 'package:omega_practice/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      // create: (_) => AuthBloc(AuthService())..add(AppStarted()),
      child: Builder(
        builder: (context) {
          final authBloc = BlocProvider.of<AuthBloc>(context);
          final appRouter = AppRouter(authBloc);

          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routeInformationParser: appRouter.goRouter.routeInformationParser,
            routerDelegate: appRouter.goRouter.routerDelegate,
          );
        },
      ),
    );
  }
}
