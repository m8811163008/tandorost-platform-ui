import 'package:intl/intl.dart' as intl;

import 'component_library_localizations.dart';

/// The translations for Persian (`fa`).
class ComponentLibraryLocalizationsFa extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get foodSelectionScreenTextFieldHint => 'جستجوی غذا';

  @override
  String get uomCardHomanyGramsLable => 'گِرم';

  @override
  String foodTimeInputDateTimeLabelText(String timeStatus) {
    String _temp0 = intl.Intl.selectLogic(
      timeStatus,
      {
        'past': 'کی خوردید؟',
        'now': 'کی خوردید؟',
        'future': 'کی میخورید؟',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String foodTimeInputDateTimeLabelVelue(String timeStatus) {
    String _temp0 = intl.Intl.selectLogic(
      timeStatus,
      {
        'past': 'ساعت پیش',
        'now': 'الان',
        'future': 'ساعت دیگر',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get nutritionDataFatLabel => 'چربی';

  @override
  String get nutritionDataCarbohydrateLabel => 'کربوهیدرات';

  @override
  String get nutritionDataProteinLabel => 'پروتئین';

  @override
  String get foodDataCalarieLabel => 'کالری';

  @override
  String foodDataPercentValue(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPercentPattern(
      locale: localeName,
      decimalDigits: 1
    );
    final String valueString = valueNumberFormat.format(value);

    return '$valueString';
  }
}
