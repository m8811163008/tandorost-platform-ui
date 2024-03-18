import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:food_selection/food_selection.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: FoodSelectionRoute.routeName,
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return BlocProvider(
                create: (context) => FoodSelectionBloc(
                  RepositoryProvider.of<FoodRepostiory>(context),
                ),
                child: child,
              );
            },
            routes: [
              GoRoute(
                  name: FoodSelectionRoute.routeName,
                  path: FoodSelectionRoute.routeName,
                  builder: (context, state) {
                    return const FoodSelectionRoute();
                  },
                  routes: [
                    GoRoute(
                      name: FoodAmountPage.routeName,
                      path: FoodAmountPage.routeName,
                      builder: (context, state) {
                        return const FoodAmountPage();
                      },
                    ),
                  ]),
            ]),
      ],
    );
  }
}
