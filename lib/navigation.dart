import 'package:flutter/material.dart';

import 'package:food/food.dart';

import 'package:food_selection/food_selection.dart';

import 'package:component_library/component_library.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:domain_model/domain_model.dart';
import 'package:profile/profile.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      observers: [
        SentryNavigatorObserver(),
      ],
      // initialLocation: Routes.profile,
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
            return child;
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
                  name: Routes.foodSelectionFoodAmountInput,
                  path: Routes.foodSelectionFoodAmountInput,
                  builder: (context, state) {
                    return const FoodAmountPage();
                  },
                ),
              ],
              // onExit: (context) async {
              //   return await showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         title: const Text('آیا میخواهید خارج شوید؟'),
              //         actions: <Widget>[
              //           TextButton(
              //             style: TextButton.styleFrom(
              //               textStyle: Theme.of(context).textTheme.labelLarge,
              //             ),
              //             child: const Text('بازگشت'),
              //             onPressed: () {
              //               Navigator.of(context).pop(false);
              //             },
              //           ),
              //           TextButton(
              //             style: TextButton.styleFrom(
              //               textStyle: Theme.of(context).textTheme.labelLarge,
              //             ),
              //             child: const Text('تایید'),
              //             onPressed: () {
              //               Navigator.of(context).pop(true);
              //             },
              //           ),
              //         ],
              //       );
              //     },
              //   );
              // },
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
        ShellRoute(
            builder: (context, state, child) {
              return child;
            },
            routes: [
              GoRoute(
                  name: Routes.profile,
                  path: Routes.profile,
                  builder: (context, state) {
                    return const ProfileRoute();
                  },
                  routes: [
                    GoRoute(
                      name: Routes.profileActivePremiumWizard,
                      path: Routes.profileActivePremiumWizard,
                      builder: (context, state) {
                        return const ActivePremiumWizardRoute();
                      },
                    ),
                  ]),
            ]),
      ],
    );
  }
}
