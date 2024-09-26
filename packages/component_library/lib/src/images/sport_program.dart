import 'package:flutter/widgets.dart';

class SportProgramImage extends StatelessWidget {
  const SportProgramImage({
    super.key,
    required this.imageNumber,
  });
  final int imageNumber;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageNumber.jpg',
      package: 'component_library',
      fit: BoxFit.cover,
    );
  }
}
