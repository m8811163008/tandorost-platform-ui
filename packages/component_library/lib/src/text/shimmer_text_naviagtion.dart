import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextNavigation extends StatelessWidget {
  const ShimmerTextNavigation(
      {super.key, this.isEnd = false, this.isError = false});
  final bool isEnd;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: !isError
          ? Shimmer.fromColors(
              direction: ShimmerDirection.rtl,
              child: Text(
                !isEnd ? '>>>>' : '>کافه بازار>',
                style: context.themeData.textTheme.displayLarge,
              ),
              baseColor: context.themeData.colorScheme.surface,
              highlightColor: context.themeData.colorScheme.primary,
            )
          : Shimmer.fromColors(
              // direction: ShimmerDirection.rtl,
              child: Text(
                '--خطا--',
                style: context.themeData.textTheme.displayLarge,
              ),
              baseColor: context.themeData.colorScheme.surface,
              highlightColor: context.themeData.colorScheme.error,
            ),
    );
  }
}
