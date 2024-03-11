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
  static TextTheme get iranSansFaNumFontFamily => const TextTheme().apply(
        fontFamily: 'IranSansFaNum',
        package: 'bpay_theme',
      );

  /// Returns the TextTheme with the iranSansEnNumFontFamily font family.
  static TextTheme get iranSansEnNumFontFamily => const TextTheme().apply(
        fontFamily: 'IranSansEnNum',
        package: 'bpay_theme',
      );
}

/// Extension methods for ColorScheme.
extension ColorSchemeExtension on ColorScheme {
  /// Returns the light ColorScheme for the BPay theme.
  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffe13135),
        surfaceTint: Color(0xffbd1020),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffffdad7),
        onPrimaryContainer: Color(0xff410004),
        secondary: Color(0xff5b6471),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffffdad7),
        onSecondaryContainer: Color(0xff19202b),
        tertiary: Color(0xff7d5260),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffffd8e4),
        onTertiaryContainer: Color(0xff31111d),
        error: Color(0xffb02f00),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdbd1),
        onErrorContainer: Color(0xff3b0900),
        background: Color(0xfff7faff),
        onBackground: Color(0xff1d1b20),
        surface: Color(0xfff7faff),
        onSurface: Color(0xff19202b),
        surfaceVariant: Color(0xffe7e0ec),
        onSurfaceVariant: Color(0xff49454f),
        outline: Color(0xff79747e),
        outlineVariant: Color(0xffcac4d0),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff322f35),
        inversePrimary: Color(0xffc2ccdc),
      );

  /// Returns the dark ColorScheme for the BPay theme.
  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffffb3ad),
        surfaceTint: Color(0xffffb3ad),
        onPrimary: Color(0xff68000a),
        primaryContainer: Color(0xff930013),
        onPrimaryContainer: Color(0xffffdad7),
        secondary: Color(0xffc2ccdc),
        onSecondary: Color(0xff2d3541),
        secondaryContainer: Color(0xff444c58),
        onSecondaryContainer: Color(0xffdee8f8),
        tertiary: Color(0xffefb8c8),
        onTertiary: Color(0xff492532),
        tertiaryContainer: Color(0xff633b48),
        onTertiaryContainer: Color(0xffffd8e4),
        error: Color(0xffffb5a0),
        onError: Color(0xff5f1500),
        errorContainer: Color(0xff862200),
        onErrorContainer: Color(0xffffdbd1),
        background: Color(0xff121418),
        onBackground: Color(0xffe6e0e9),
        surface: Color(0xff121418),
        onSurface: Color(0xffe6e0e9),
        surfaceVariant: Color(0xff49454f),
        onSurfaceVariant: Color(0xffcac4d0),
        outline: Color(0xff938f99),
        outlineVariant: Color(0xff49454f),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe6e0e9),
        inversePrimary: Color(0xffbd1020),
      );
}
