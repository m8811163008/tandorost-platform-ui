import 'package:flutter/material.dart';

class BodyCompositionImage extends StatelessWidget {
  const BodyCompositionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/body_composition_sites.png',
      package: 'component_library',
    );
  }
}
