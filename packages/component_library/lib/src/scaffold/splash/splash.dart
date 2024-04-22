import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash.jpg',
      package: 'component_library',
      fit: BoxFit.cover,
    );
  }
}
