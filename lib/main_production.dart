import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tandorost/tandorost_bootstrap.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'dart:developer';

/// Tandorost application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterError.onError = (FlutterErrorDetails details) async {
    // showDialog(context: context, builder: ((context) => AlertDialog(
    //   icon: Icon(Ionicons.bug),
    //   title: Text('خطایی رخ داده'),
    //   content: Text('آیا اجازه میدهید خطا را به پشتیبانی ارسال کنیم؟'),
    // ));
    await Sentry.captureException(
      details.exception,
      stackTrace: details.stack,
    );
    // Reports an [event] to Sentry.io.
    // static Future<SentryId> captureEvent(

    //  Reports a [message] to Sentry.io.
    // static Future<SentryId> captureMessage(

    /// Reports a [userFeedback] to Sentry.io.
    ///
    /// First capture an event and use the [SentryId] to create a [SentryUserFeedback]
    // static Future<void> captureUserFeedback(SentryUserFeedback userFeedback) =>

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
// add new food when no food found

// simple profile for bazzar login
// in app purchase for a test widget
// user agreement and add phycology of writing calorie and its telorance and perception of food calories
// add support with insta page
// add form of energy and macro nutrition requirements
// suggest learning and sport and some nutrition considiration
// chnage the widget of banner for calorie (leanear indicator, and update pie chart and labels)
// add exercise volume in selected food list banner
// learning material for which food is for weight lose(آموزش خوراکی های کاهش وزن را بشناسید یا همچین چیزی)
// in app purchase for 1 month subscription and 3 months 



// clean streams in blocs, make them same shape or something like that
// sort food base on calorie and carbohydrate and fat in selected foods list
// add unit of measurment when add food, currently it only allow for 100 grams
// add unit of measurments modifiable list 
// wellcome screen
// add chat gpt for food and recepies
