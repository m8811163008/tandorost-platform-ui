import 'package:flutter/widgets.dart';

class FuelMixtureImage extends StatelessWidget {
  const FuelMixtureImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/fuel_mixture.jpg',
      package: 'component_library',
      fit: BoxFit.cover,
    );
  }
}
