import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food/food.dart';
import 'package:food_repository/food_repository.dart';

import 'package:food_selection/food_selection.dart';

import 'package:component_library/component_library.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:domain_model/domain_model.dart';
import 'package:profile/profile.dart';
import 'package:user_repository/user_repository.dart';
import 'package:splash/splash.dart';

class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
      // TODO handle onExit

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
            return SplashRoute(
              onDone: () async {
                final userProfile =
                    await RepositoryProvider.of<UserRepostiory>(context)
                        .userProfile
                        .first;
                await Future.delayed(Duration(seconds: 1));
                if (context.mounted) {
                  if (userProfile == const ProfileCM.empty()) {
                    context.goNamed(Routes.profile);
                  } else {
                    context.goNamed(Routes.foodSelection);
                  }
                }
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
              // lazy: true,
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
                  name: Routes.foodSelectionFoodAmountInput,
                  path: Routes.foodSelectionFoodAmountInput,
                  builder: (_, state) {
                    return const FoodAmountPage();
                  },
                ),
              ],
            )
          ],
        ),
        GoRoute(
          name: Routes.foodSelectionList,
          path: Routes.foodSelectionList,
          builder: (context, state) {
            return const SelectedFoodsListPage();
          },
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
      refreshListenable: RedirectListenable(
          profileStream:
              RepositoryProvider.of<UserRepostiory>(context).userProfile),
      redirect: (context, state) async {
        if (state.uri.path.contains(Routes.profile)) {
          final userProfile =
              await RepositoryProvider.of<UserRepostiory>(context)
                  .userProfile
                  .first;
          if (userProfile == const ProfileCM.empty()) {
            return '${Routes.profile}/${Routes.profileActivePremiumWizard}';
          }
        }
        return null;
      },
    );
  }

  static Future<bool> _exitCallback(BuildContext context) async {
    // TODO handle on exit
    // final gorouteState = GoRouterState.of(context);
    // final isExit = await showDialog<bool>(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: const Text('آیا میخواهید خارج شوید؟'),
    //           actions: <Widget>[
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 textStyle: Theme.of(context).textTheme.labelLarge,
    //               ),
    //               child: const Text('بازگشت'),
    //               onPressed: () {
    //                 Navigator.of(context).pop(false);
    //               },
    //             ),
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 textStyle: Theme.of(context).textTheme.labelLarge,
    //               ),
    //               child: const Text('تایید'),
    //               onPressed: () {
    //                 Navigator.of(context).pop(true);
    //               },
    //             ),
    //           ],
    //         );
    //       },
    //     ) ??
    //     false;
    // if (isExit && context.mounted) {
    //   ScaffoldMessenger.of(context)
    //     ..hideCurrentMaterialBanner()
    //     ..hideCurrentSnackBar();
    // }
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }

    return true;
  }
}

class RedirectListenable extends ChangeNotifier {
  final Stream<ProfileCM> profileStream;
  late final StreamSubscription subscription;

  RedirectListenable({required this.profileStream}) {
    subscription = profileStream.listen((event) {
      notifyListeners();
    });
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
