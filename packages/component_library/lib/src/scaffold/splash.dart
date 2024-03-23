import 'dart:async';

import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, this.onDone});
  static const routeName = '/splash';
  final VoidCallback? onDone;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(seconds: 2), () {
      widget.onDone?.call();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash.jpg',
      package: 'component_library',
      fit: BoxFit.cover,
    );
  }
}
