import 'package:flutter/material.dart';

class WaistCircumferenceImage extends StatelessWidget {
  const WaistCircumferenceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/waist_circumference.png',
      package: 'component_library',
    );
  }
}
