import 'package:auth_repository/auth_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/splash.dart';

class SplashRoute extends StatelessWidget {
  const SplashRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
          authRepostiory: RepositoryProvider.of<AuthRepostiory>(context)),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
