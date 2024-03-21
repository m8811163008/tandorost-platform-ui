import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

extension BuildContextTranslation on BuildContext {
  ComponentLibraryLocalizations get l10n =>
      ComponentLibraryLocalizations.of(this);
  FontsExtenstion get fontsExtenstion =>
      Theme.of(this).extension<FontsExtenstion>()!;
  SizesExtenstion get sizesExtenstion =>
      Theme.of(this).extension<SizesExtenstion>()!;

  ThemeData get themeData => Theme.of(this);

  void showBanner({required MaterialBanner materialBanner}) {
    ScaffoldMessenger.of(this).showMaterialBanner(
      materialBanner,
    );
  }

  void showSnackbar({required SnackBar snackBar}) {
    ScaffoldMessenger.of(this).showSnackBar(
      snackBar,
    );
  }
}
