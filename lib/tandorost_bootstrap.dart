import 'package:food_selection/food_selection.dart';
import 'package:local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:profile/profile.dart';
import 'package:tandorost/tandorost_application.dart';
import 'package:user_repository/user_repository.dart';

class TandorostBootstrap extends StatefulWidget {
  const TandorostBootstrap({super.key});

  @override
  State<TandorostBootstrap> createState() => _TandorostBootstrapState();
}

class _TandorostBootstrapState extends State<TandorostBootstrap> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          getTemporaryDirectory(),
          getApplicationDocumentsDirectory(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done &&
              snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          //provide data providers
          final LocalStorage cacheStorage = LocalStorage(
            tempDirectory: snapshot.data![0],
            appDirectory: snapshot.data![1],
          );

          //initialize repositories
          late final FoodRepostiory foodRepository = FoodRepostiory(
            cacheStorage,
          );

          late final UserRepostiory userRepository = UserRepostiory(
            cacheStorage,
          );
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: foodRepository),
              RepositoryProvider.value(value: userRepository),
            ],
            child: MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => ProfileCubit(
                  RepositoryProvider.of<UserRepostiory>(context),
                  RepositoryProvider.of<FoodRepostiory>(context),
                ),
                lazy: true,
              ),
              BlocProvider(
                create: (context) => FoodSelectionBloc(
                  RepositoryProvider.of<FoodRepostiory>(context),
                ),
                lazy: true,
              ),
            ], child: const TandorostApplication()),
          );
        });
  }
}
