import 'dart:ui';

import 'package:flutter/material.dart';

/// A class that represents the extension for defining sizes in a theme.
class SizesExtenstion extends ThemeExtension<SizesExtenstion> {
  final double none;
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;
  final double full;

  /// Creates a [SizesExtenstion] with the specified sizes.
  const SizesExtenstion({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.full,
  });

  /// Creates a [SizesExtenstion] with default size values.
  factory SizesExtenstion.defaultValues() {
    return const SizesExtenstion(
      none: 0,
      extraSmall: 4,
      small: 8,
      medium: 16,
      large: 24,
      extraLarge: 32,
      full: double.infinity,
    );
  }

  @override
  ThemeExtension<SizesExtenstion> copyWith({
    double? none,
    double? extraSmall,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
    double? full,
  }) {
    return SizesExtenstion(
      none: none ?? this.none,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      full: full ?? this.full,
    );
  }

  @override
  ThemeExtension<SizesExtenstion> lerp(
      covariant ThemeExtension<SizesExtenstion>? other, double t) {
    if (other is! SizesExtenstion) {
      return this;
    }
    return SizesExtenstion(
      none: lerpDouble(none, other.none, t)!,
      extraSmall: lerpDouble(extraSmall, other.extraSmall, t)!,
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
      extraLarge: lerpDouble(extraLarge, other.extraLarge, t)!,
      full: lerpDouble(full, other.full, t)!,
    );
  }

  @override
  String toString() =>
      'SizesExtenstion(none: $none, extraSmall: $extraSmall, small: $small, medium: $medium, large: $large, extraLarge: $extraLarge, full: $full)';
}
