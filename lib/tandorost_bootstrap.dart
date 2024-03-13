import 'package:cache_storage/cache_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:tandorost/tandorost_application.dart';

class TandorostBootstrap extends StatefulWidget {
  const TandorostBootstrap({super.key});

  @override
  State<TandorostBootstrap> createState() => _TandorostBootstrapState();
}

class _TandorostBootstrapState extends State<TandorostBootstrap> {
  //provide data providers
  final CacheStorage cacheStorage = CacheStorage();

  //initialize repositories
  late final FoodRepostiory foodRepository = FoodRepostiory(
    cacheStorage,
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: foodRepository),
      ],
      child: const TandorostApplication(),
    );
  }
}
