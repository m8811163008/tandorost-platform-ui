import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tandorost/tandorost_bootstrap.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterError.onError = (FlutterErrorDetails details) async {
    log(details.exception.runtimeType.toString(),
        error: details.exception, stackTrace: details.stack);
    // await Sentry.captureException(
    //   details.exception,
    //   stackTrace: details.stack,
    // );
    // log('error in ${details.library}',
    //     stackTrace: details.stack, error: details.exception);
  };

  // e.g. "Moto G (4)"
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://1d10de0455222c0ba27560b4f0071ff3@o4504084043530240.ingest.us.sentry.io/4506958323253248';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const TandorostBootstrap()),
  );
}

// add how to use
// refactor
// notification
// boghalamon
// add sharable units(for sustainable business to pay kerayekhune)
// error handling of forms for example UpsertFoodBottomSheet
// add update
// add support with insta page and website and phone number [تماس با پشتیبانی]
// sell in bazzar
// check debug on deploy
// build and deploy[2h]
// [x]can not emit state after calling close!
//
// hold to create recipe from list and handle name conflict
// add comment 
// add next month and last month to date picker in initilize profile wizard date picker
// add the line indicator chart and text in selected foods list
// toggle charts type in setting
// edit profile
// fasting
// add general sport in lose weight with 62 and 63% of VO2max, how to calculate vo2 max? optimum speed for weight lose
// handle create a new food and name conflict in creating new food in creating new food from selectedFoods
//
// sppeed up create food when in search field in main page we search food then it goes add new food but did not hold the state for back to add food
// add chat gpt for food values
// add chat gpt for recipe
// add tips at main routes and add phycology of writing calorie and its telorance and perception of food calories(in free)
// show double weight in chart in profile
// create outlined icons
//
// recalculate
// news feed like myfitnesspal
// learning material for which food is for weight lose(آموزش خوراکی های کاهش وزن را بشناسید یا همچین چیزی)
// add unit of measurments modifiable list 
// show pictures in profile section , optimize to share on social
// internationalization
// body building and fitness platform
// store in Iran
// fix paragraph consideration with input chips in descriptions and UI design
// add change color in setting
// add magnifier and font size setting and density instaed of current scale factor 1.5
// implement bazzar login
// backup
// implement affiliate marketing, link or code

// [x] health repository [3h]
// [x] وضعیت فعلی شما در پروفایل[2h]
// [x] authentication repostiory [4h]
// [x] user role for widget tree and then navigation then widgets, create authention widget with stream [3h]
// [x] create fading text of current stiation in profiel [1h]
// [x] add recharge subscription or add subscription button [1h]
// [x] then after opening profile if it is the logged in user then should authenticate with bazzar and can see setting for guest user [1h]
// [x] add exercise volume day in selected food list banner for subscribers[1h]
// [x] chnage the widget of banner for calorie (leanear indicator, and update pie chart and labels) for subscribers[1h]
// [x] expantion tile of considrations with sticky header in selected food list [3h]
// [x] in app purchase for 1 month subscription and 3 months [6h]
// [x] banner for paied user
// [x] hold the state of selected food for unit of measurement 
// [x] add new food when no food found
// [x] simple profile for bazzar login
// [x] user agreement 
// [x] add form of energy and macro nutrition requirements
// [x] add FAB to list of selected food
// [x] show how to use counters or expand counter for now to use thumb
// [x] alert of very high rate
// [x] reset database and ask do you want restore default foods
// [x] initalize data storage from data storage layer then expose initialize to repositories so they can reset or initialize when needed

