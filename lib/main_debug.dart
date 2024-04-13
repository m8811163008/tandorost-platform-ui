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

// health repository [3h]
// وضعیت فعلی شما در پروفایل[2h]
// authentication repostiory [4h] 
// user role for widget tree and then navigation then widgets, create authention widget with stream [3h]
// create fading text of current stiation in profiel [1h]
// add recharge subscription or add subscription button [1h]
// then after opening profile if it is the logged in user then should authenticate with bazzar and can see setting for guest user [1h]
// add exercise volume day in selected food list banner for subscribers[1h]
// chnage the widget of banner for calorie (leanear indicator, and update pie chart and labels) for subscribers[1h]
// expantion tile of considrations with sticky header in selected food list [3h]
// in app purchase for 1 month subscription and 3 months [6h]
// center search text field [1h]
// add tips at main routes and add phycology of writing calorie and its telorance and perception of food calories[5h]
// build and deploy[2h]
// sell
// change the pire chart and text in selected foods list




// news feed like myfitnesspal
// add support with insta page and website and phone number [تماس با پشتیبانی].
// add update
// hold to create recipe from list and handle name conflict
// banner for paied user
// sppeed up create food when in search field in main page we search food then it goes add new food but did not hold the state for back to add food
// [x] hold the state of selected food for unit of measurement 
// [x] add new food when no food found
// [x] simple profile for bazzar login
// [x] user agreement 
// [x] add form of energy and macro nutrition requirements
// show double weight in chart in profile
// suggest learning and sport and some nutrition considiration
// learning material for which food is for weight lose(آموزش خوراکی های کاهش وزن را بشناسید یا همچین چیزی)
// add comment 
// [x] add FAB to list of selected food
// [x] show how to use counters or expand counter for now to use thumb
// handle create a new food and name conflict in creating new food in creating new food from selectedFoods
// edit profile
// [x] alert of very high rate
// create outlined icons
// refactor text fields to stateless
// add dashboard
// [x] reset database and ask do you want restore default foods
// clean streams in blocs, make them same shape or something like that
// sort food base on calorie and carbohydrate and fat in selected foods list
// add unit of measurments modifiable list 
// wellcome screen
// add chat gpt for food and recepies
// show pictures in profile section , optimize to share on social
// recalculate
// error handling of forms for example UpsertFoodBottomSheet
// animation to text field of first page

// [x] initalize data storage from data storage layer then expose initialize to repositories so they can reset or initialize when needed
// add magnifier and font size setting and density
// add change color in setting
// add general sport in lose weight with 62 and 63% of VO2max, how to calculate vo2 max? optimum speed for weight lose
