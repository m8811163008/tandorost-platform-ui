import 'package:auth_repository/auth_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/splash.dart';

class SplashRoute extends StatelessWidget {
  const SplashRoute({super.key, this.onDone});
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: RepositoryProvider.of<AuthRepostiory>(context)
          .currentUserRulesStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          onDone?.call();
        }

        return SplashScreen();
      },
    );
  }
}
