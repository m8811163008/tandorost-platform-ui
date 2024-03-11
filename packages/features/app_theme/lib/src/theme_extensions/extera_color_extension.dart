import 'package:app_theme/src/models/color_family.dart';
import 'package:flutter/material.dart';

class ExtraColorExtenstion extends ThemeExtension<ExtraColorExtenstion> {
  final ColorFamily info;
  final ColorFamily success;

  const ExtraColorExtenstion({
    required this.info,
    required this.success,
  });

  factory ExtraColorExtenstion.defaultLightTheme() =>
      const ExtraColorExtenstion(
        info: ColorFamily(
          color: Color(0xff0060a8),
          onColor: Color(0xffffffff),
          colorContainer: Color(0xffd3e4ff),
          onColorContainer: Color(0xff001c38),
        ),
        success: ColorFamily(
          color: Color(0xff006e2d),
          onColor: Color(0xffffffff),
          colorContainer: Color(0xffb1f2b5),
          onColorContainer: Color(0xff002109),
        ),
      );

  factory ExtraColorExtenstion.defaultDarkTheme() => const ExtraColorExtenstion(
        info: ColorFamily(
          color: Color(0xffa2c9ff),
          onColor: Color(0xff00315b),
          colorContainer: Color(0xff004881),
          onColorContainer: Color(0xffd3e4ff),
        ),
        success: ColorFamily(
          color: Color(0xff37e36e),
          onColor: Color(0xff003914),
          colorContainer: Color(0xff005320),
          onColorContainer: Color(0xffb1f2b5),
        ),
      );

  @override
  ThemeExtension<ExtraColorExtenstion> copyWith(
      {ColorFamily? info, ColorFamily? success}) {
    return ExtraColorExtenstion(
      info: info ?? this.info,
      success: success ?? this.success,
    );
  }

  @override
  ThemeExtension<ExtraColorExtenstion> lerp(
      covariant ThemeExtension<ExtraColorExtenstion>? other, double t) {
    if (other is! ExtraColorExtenstion) {
      return this;
    }
    return ExtraColorExtenstion(
      info: info.lerp(other.info, t),
      success: success.lerp(other.success, t),
    );
  }

  @override
  String toString() => 'MyColors(info: $info, success: $success)';
}
