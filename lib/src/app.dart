import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/bloc/gallery/gallery_bloc.dart';
import 'package:omega_practice/src/bloc/image/image_bloc.dart';
import 'package:omega_practice/src/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()..add(CheckUser())),
        BlocProvider<GalleryBloc>(
          create: (_) => GalleryBloc()..add(GalleryLoad()),
        ),
        BlocProvider<ImageBloc>(create: (_) => ImageBloc()),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final authBloc = BlocProvider.of<AuthBloc>(context);
          final appRouter = AppRouter(authBloc);

          return MaterialApp.router(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            ),
            routerConfig: appRouter.goRouter,
          );
        },
      ),
    );
  }
}
