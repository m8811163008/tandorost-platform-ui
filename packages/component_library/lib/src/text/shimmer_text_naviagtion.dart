import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextNavigation extends StatelessWidget {
  const ShimmerTextNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Shimmer.fromColors(
        child: Text(
          '<<<<<',
          style: context.themeData.textTheme.displayLarge,
        ),
        baseColor: context.themeData.colorScheme.surface,
        highlightColor: context.themeData.colorScheme.primary,
      ),
    );
  }
}
