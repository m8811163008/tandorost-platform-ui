import 'package:flutter/material.dart';

class FontsExtenstion extends ThemeExtension<FontsExtenstion> {
  final TextStyle titleMediumProminent;
  final TextStyle labelLargeProminent;
  final TextStyle labelMediumProminent;

  const FontsExtenstion({
    required this.titleMediumProminent,
    required this.labelLargeProminent,
    required this.labelMediumProminent,
  });

  factory FontsExtenstion.defaultValues({String? fontFamily}) {
    return FontsExtenstion(
      titleMediumProminent: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        height: 26 / 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.0,
      ),
      labelLargeProminent: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.0,
      ),
      labelMediumProminent: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.0,
      ),
    );
  }

  @override
  ThemeExtension<FontsExtenstion> copyWith({
    TextStyle? titleMediumProminent,
    TextStyle? labelLargeProminent,
    TextStyle? labelMediumProminent,
  }) {
    return FontsExtenstion(
      titleMediumProminent: titleMediumProminent ?? this.titleMediumProminent,
      labelLargeProminent: labelLargeProminent ?? this.labelLargeProminent,
      labelMediumProminent: labelMediumProminent ?? this.labelMediumProminent,
    );
  }

  @override
  ThemeExtension<FontsExtenstion> lerp(
      covariant ThemeExtension<FontsExtenstion>? other, double t) {
    if (other is! FontsExtenstion) {
      return this;
    }
    return FontsExtenstion(
      titleMediumProminent:
          TextStyle.lerp(titleMediumProminent, other.titleMediumProminent, t) ??
              titleMediumProminent,
      labelLargeProminent:
          TextStyle.lerp(labelLargeProminent, other.labelLargeProminent, t) ??
              labelLargeProminent,
      labelMediumProminent:
          TextStyle.lerp(labelMediumProminent, other.labelMediumProminent, t) ??
              labelMediumProminent,
    );
  }

  @override
  String toString() =>
      'FontsExtenstion($titleMediumProminent, $labelLargeProminent, $labelMediumProminent)';
}
