import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextNavigation extends StatelessWidget {
  const ShimmerTextNavigation(
      {super.key, this.isEnd = false, this.isError = false, this.title = ''});
  final bool isEnd;
  final bool isError;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: !isError
          ? Shimmer.fromColors(
              direction: ShimmerDirection.rtl,
              baseColor: context.themeData.colorScheme.surface,
              highlightColor: context.themeData.colorScheme.primary,
              child: Text(
                !isEnd ? '>>>>' : '>$title>',
                style: context.themeData.textTheme.displayLarge,
              ),
            )
          : Shimmer.fromColors(
              // direction: ShimmerDirection.rtl,
              baseColor: context.themeData.colorScheme.surface,
              highlightColor: context.themeData.colorScheme.error,
              // direction: ShimmerDirection.rtl,
              child: Text(
                '--خطا--',
                style: context.themeData.textTheme.displayLarge,
              ),
            ),
    );
  }
}
