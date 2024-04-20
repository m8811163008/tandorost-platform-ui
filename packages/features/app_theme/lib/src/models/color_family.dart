import 'dart:ui';

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;

  @override
  String toString() {
    return 'ColorFamily(color: $color, onColor: $onColor, colorContainer: $colorContainer, onColorContainer: $onColorContainer)';
  }
}

extension ColorFamilyExtension on ColorFamily {
  ColorFamily lerp(
    ColorFamily other,
    double t,
  ) {
    return ColorFamily(
      color: Color.lerp(color, other.color, t)!,
      onColor: Color.lerp(onColor, other.onColor, t)!,
      colorContainer: Color.lerp(colorContainer, other.colorContainer, t)!,
      onColorContainer:
          Color.lerp(onColorContainer, other.onColorContainer, t)!,
    );
  }
}
