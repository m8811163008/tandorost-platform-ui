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
  String get foodDataCalarieLabel => 'کیلوکالری';

  @override
  String foodDataPercentValue(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPercentPattern(
      locale: localeName,
      decimalDigits: 1
    );
    final String valueString = valueNumberFormat.format(value);

    return '$valueString';
  }

  @override
  String unitOfMeasurementTitle(String uomType) {
    String _temp0 = intl.Intl.selectLogic(
      uomType,
      {
        'grams': 'گرم',
        'tableSpoon': 'قاشق غذاخوری',
        'calorie': 'کیلوکالری',
        'gramsPerUnit': 'عدد متوسط',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String selectedFoodTileEatDateValue(String timeValue, String dateValue) {
    return 'در ساعت $timeValue و تاریخ $dateValue';
  }

  @override
  String get selectCustomDateTimeRangeDialogTitle => 'انتخاب تاریخ';

  @override
  String get selectCustomDateTimeRangeDialogFromDate => 'از تاریخ';

  @override
  String get selectCustomDateTimeRangeDialogFromTime => 'از ساعت';

  @override
  String get selectCustomDateTimeRangeDialogToDate => 'تا تاریخ';

  @override
  String get selectCustomDateTimeRangeDialogToTime => 'تا ساعت';

  @override
  String get buttonConfirmText => 'تایید';

  @override
  String get buttonCancleText => 'لغو';

  @override
  String get filterSelectedFoodsSelectDateTimeOptionRow1 => 'تا دیشب ساعت 00:00';

  @override
  String get filterSelectedFoodsSelectDateTimeOptionRow2 => 'از الان تا 7 روز پیش';

  @override
  String get filterSelectedFoodsSelectDateTimeOptionRow3 => 'انتخاب بازه زمانی';

  @override
  String get selectedFoodListBannerLabelEnergy => 'جمع ⚡️';
}
