import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tandorost/tandorost_bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const TandorostBootstrap());
}
