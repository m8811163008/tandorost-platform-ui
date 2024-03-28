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
      primary: Color(4281164427),
      surfaceTint: Color(4281164427),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291683839),
      onPrimaryContainer: Color(4278197554),
      secondary: Color(4283523183),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292142326),
      onSecondaryContainer: Color(4279049514),
      tertiary: Color(4284962938),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293778687),
      onTertiaryContainer: Color(4280423731),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      surfaceVariant: Color(4292797419),
      onSurfaceVariant: Color(4282533710),
      outline: Color(4285692030),
      outlineVariant: Color(4290955215),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),

      inversePrimary: Color(4288334842),

      );

  /// Returns the dark ColorScheme for the BPay theme.
  static ColorScheme get darkColorScheme => const ColorScheme(
brightness: Brightness.dark,
      primary: Color(4288334842),
      surfaceTint: Color(4288334842),
      onPrimary: Color(4278203218),
      primaryContainer: Color(4278864498),
      onPrimaryContainer: Color(4291683839),
      secondary: Color(4290365658),
      onSecondary: Color(4280496704),
      secondaryContainer: Color(4281944151),
      onSecondaryContainer: Color(4292142326),
      tertiary: Color(4292001767),
      onTertiary: Color(4281870922),
      tertiaryContainer: Color(4283383905),
      onTertiaryContainer: Color(4293778687),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279243800),
      onBackground: Color(4292928232),
      surface: Color(4279243800),
      onSurface: Color(4292928232),
      surfaceVariant: Color(4282533710),
      onSurfaceVariant: Color(4290955215),
      outline: Color(4287402392),
      outlineVariant: Color(4282533710),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inversePrimary: Color(4281164427),
      );
}

class CustomColor {
  static const Color fat = Colors.yellow;
  static const Color protein = Colors.red;
  static const Color carbohydrate = Colors.brown;
}
