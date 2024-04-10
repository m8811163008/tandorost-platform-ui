import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, this.onDone, this.onInit});

  final VoidCallback? onDone;
  final AsyncCallback? onInit;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late final Timer _timer;

  @override
  void initState() {
    widget.onInit?.call();
    _timer = Timer(const Duration(seconds: 1), () {
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
