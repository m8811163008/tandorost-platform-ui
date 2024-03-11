import 'package:component_library/component_library.dart';
import 'package:flutter/widgets.dart';

extension BuildContextTranslation on BuildContext {
  ComponentLibraryLocalizations get l10n =>
      ComponentLibraryLocalizations.of(this);
}
