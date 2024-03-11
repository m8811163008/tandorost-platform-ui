import 'package:flutter/material.dart';
import 'package:food_selection/food_selection.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const FoodSelectionRoute();
          },
        ),
      ],
    );
  }
}
