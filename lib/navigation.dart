import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/food.dart';
import 'package:food_repository/food_repository.dart';
import 'package:food_selection/food_selection.dart';

import 'package:component_library/component_library.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:domain_model/domain_model.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      observers: [
        SentryNavigatorObserver(),
      ],
      initialLocation: Routes.splash,
      routes: [
        GoRoute(
          name: Routes.splash,
          path: Routes.splash,
          builder: (context, state) {
            return Splash(
              onDone: () async {
                context.goNamed(Routes.foodSelection);
              },
            );
          },
        ),
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
              name: Routes.foodSelection,
              path: Routes.foodSelection,
              builder: (context, state) {
                return const FoodSelectionRoute();
              },
              routes: [
                GoRoute(
                  name: Routes.foodAmountInput,
                  path: Routes.foodAmountInput,
                  builder: (context, state) {
                    return const FoodAmountPage();
                  },
                ),
              ],
            ),
            GoRoute(
              name: Routes.foodSelectionList,
              path: Routes.foodSelectionList,
              builder: (context, state) {
                return const SelectedFoodsListPage();
              },
              onExit: (context) {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                return true;
              },
            ),
          ],
        ),
        GoRoute(
          name: Routes.foodList,
          path: Routes.foodList,
          builder: (context, state) {
            return const FoodsListRoute();
          },
        ),
      ],
    );
  }
}
