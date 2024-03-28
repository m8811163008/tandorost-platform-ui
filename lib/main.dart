import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tandorost/tandorost_bootstrap.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'dart:developer';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterError.onError = (FlutterErrorDetails details) async {
    await Sentry.captureException(
      details.exception,
      stackTrace: details.stack,
    );
    log('error in ${details.library}',
        stackTrace: details.stack, error: details.exception);
  };
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


// hold the state of selected food for unit of measurement
// clean streams in blocs, make them same shape or something like that
// handle if no food found in search foods
// sort food base on calorie and carbohydrate and fat in selected foods list
// add unit of measurment when add food, currently it only allow for 100 grams
// add unit of measurments modifiable list 
// hold the state of last selected unit of measurment in addign food
// change theme > screenshot > create banners
// wellcome screen
