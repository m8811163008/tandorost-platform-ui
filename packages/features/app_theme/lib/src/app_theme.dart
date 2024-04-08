import 'package:app_theme/src/theme_extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

/// The base abstract class for the BPay theme data.
///
/// It defines the base theme data for the BPay application.
/// It provides a materialThemeData getter that returns the ThemeData for the BPay application based on the color scheme and other extensions.
/// The textTheme getter returns the TextTheme based on the locale of the BPay theme.
abstract class AppThemeThemeData {
  ThemeData get materialThemeData;
  final Locale locale;
  AppThemeThemeData({required this.locale});

  @protected
  SizesExtenstion get sizesExtenstion => SizesExtenstion.defaultValues();

  @protected
  FontsExtenstion get fontsExtenstion => FontsExtenstion.defaultValues();

  /// The extra color extension for the theme.
  @protected
  ExtraColorExtenstion get colorExtenstion;

  /// The text theme for the BPay theme based on the locale.
  ///
  /// It returns the iranSansFaNumFontFamily TextTheme for 'fa', 'ar', and 'ps' locales,
  /// and the iranSansEnNumFontFamily TextTheme for other locales.
  @protected
  TextTheme get textTheme => switch (locale.languageCode) {
        'fa' => TextThemeExtenstion.iranSansFaNumFontFamily,
        _ => TextThemeExtenstion.iranSansEnNumFontFamily,
      };
}

/// The concrete implementation of the BPayThemeData class for the light theme.
///
/// It provides the materialThemeData getter that returns the ThemeData for the BPay light theme based on the color scheme and other extensions.
/// It also provides the colorExtenstion getter that returns the ExtraColorExtenstion for the BPay light theme.
final class AppThemeLightThemeData extends AppThemeThemeData {
  AppThemeLightThemeData({required super.locale});

  @override
  ThemeData get materialThemeData =>
      ThemeDataExtenstion.fromColorScheme(ColorSchemeExtension.lightColorScheme)
          .copyWith(
        textTheme: textTheme,
        extensions: [
          colorExtenstion,
          sizesExtenstion,
          fontsExtenstion,
        ],
        expansionTileTheme: const ExpansionTileThemeData(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      );

  @override
  ExtraColorExtenstion get colorExtenstion =>
      ExtraColorExtenstion.defaultLightTheme();
}

/// The concrete implementation of the BPayThemeData class for the dark theme.
///
/// It provides the materialThemeData getter that returns the ThemeData for the BPay dark theme based on the color scheme and other extensions.
/// It also provides the colorExtenstion getter that returns the ExtraColorExtenstion for the BPay dark theme.
final class AppThemeDarkThemeData extends AppThemeThemeData {
  AppThemeDarkThemeData({required super.locale});

  @override
  ThemeData get materialThemeData =>
      ThemeDataExtenstion.fromColorScheme(ColorSchemeExtension.darkColorScheme)
          .copyWith(
        textTheme: textTheme,
        extensions: [
          colorExtenstion,
          sizesExtenstion,
          fontsExtenstion,
        ],
      );

  @override
  ExtraColorExtenstion get colorExtenstion =>
      ExtraColorExtenstion.defaultDarkTheme();
}

/// Extension methods for ThemeData.
extension ThemeDataExtenstion on ThemeData {
  /// Creates a ThemeData from the given ColorScheme.
  static ThemeData fromColorScheme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );
}

/// Extension methods for TextTheme.
extension TextThemeExtenstion on TextTheme {
  /// Returns the TextTheme with the iranSansFaNumFontFamily font family.
  static TextTheme get iranSansFaNumFontFamily =>
      Typography.blackCupertino.apply(
        fontFamily: 'IranSansFaNum',
        package: 'app_theme',
      );

  /// Returns the TextTheme with the iranSansEnNumFontFamily font family.
  static TextTheme get iranSansEnNumFontFamily =>
      Typography.blackCupertino.apply(
        fontFamily: 'IranSansEnNum',
        package: 'app_theme',
      );
}

/// Extension methods for ColorScheme.
extension ColorSchemeExtension on ColorScheme {
  /// Returns the light ColorScheme for the BPay theme.
  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff2d628b),
        surfaceTint: Color(0xff2d628b),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffcde5ff),
        onPrimaryContainer: Color(0xff001d32),
        secondary: Color(0xff51606f),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffd4e4f6),
        onSecondaryContainer: Color(0xff0d1d2a),
        tertiary: Color(0xff67587a),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffeddcff),
        onTertiaryContainer: Color(0xff221533),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        background: Color(0xfff7f9ff),
        onBackground: Color(0xff181c20),
        surface: Color(0xfff7f9ff),
        onSurface: Color(0xff181c20),
        surfaceVariant: Color(0xffdee3eb),
        onSurfaceVariant: Color(0xff42474e),
        outline: Color(0xff72787e),
        outlineVariant: Color(0xffc2c7cf),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2d3135),
        inversePrimary: Color(0xff9acbfa),
      );

  /// Returns the dark ColorScheme for the BPay theme.
  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff9acbfa),
        surfaceTint: Color(0xff9acbfa),
        onPrimary: Color(0xff003352),
        primaryContainer: Color(0xff0a4a72),
        onPrimaryContainer: Color(0xffcde5ff),
        secondary: Color(0xffb9c8da),
        onSecondary: Color(0xff233240),
        secondaryContainer: Color(0xff394857),
        onSecondaryContainer: Color(0xffd4e4f6),
        tertiary: Color(0xffd2bfe7),
        onTertiary: Color(0xff382a4a),
        tertiaryContainer: Color(0xff4f4061),
        onTertiaryContainer: Color(0xffeddcff),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        background: Color(0xff101418),
        onBackground: Color(0xffe0e2e8),
        surface: Color(0xff101418),
        onSurface: Color(0xffe0e2e8),
        surfaceVariant: Color(0xff42474e),
        onSurfaceVariant: Color(0xffc2c7cf),
        outline: Color(0xff8c9198),
        outlineVariant: Color(0xff42474e),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe0e2e8),
        inversePrimary: Color(0xff2d628b),
      );
}

class CustomColor {
  static const Color fat = Colors.yellow;
  static const Color protein = Colors.red;
  static const Color carbohydrate = Colors.brown;
}
