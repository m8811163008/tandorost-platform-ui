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
  String get foodDataCalarieLabel => 'کیلوکالری در گرم';

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
  String get filterSelectedFoodsSelectDateTimeOptionRow1 => 'از دیشب ساعت 00:00';

  @override
  String get filterSelectedFoodsSelectDateTimeOptionRow2 => 'از الان تا 7 روز پیش';

  @override
  String get filterSelectedFoodsSelectDateTimeOptionRow3 => 'انتخاب بازه زمانی';

  @override
  String get selectedFoodListBannerLabelEnergy => 'جمع ⚡️';

  @override
  String get profileHeight => 'قد';

  @override
  String get profileWeight => 'وزن';

  @override
  String get profileWaistCircumference => 'دور کَمر';

  @override
  String get profileArmCircumference => 'دور بازو';

  @override
  String get profileChestCircumference => 'دور سینه';

  @override
  String get profileThightCircumference => 'دور ران';

  @override
  String get profileCalfMuscleCircumference => 'دور ماهیچه ساق پا';

  @override
  String get profileBirthday => 'تاریخ تولد';

  @override
  String get profileUsername => 'نام کاربری';

  @override
  String get profileGender => 'جنسیت';

  @override
  String get profileTarget => 'چند روز دیگر شروع میکنید؟';

  @override
  String get profileActiviyLevel => 'مقدار فعالیت';

  @override
  String get profileCentiMetre => 'سانتی متر';

  @override
  String get profileKiloGrams => 'کیلوگرم';

  @override
  String get profileMale => 'آقا';

  @override
  String get profileFemail => 'خانم';

  @override
  String profileAgeText(String year) {
    return '$year سال ';
  }

  @override
  String profileActivityLevelButtonLabel(String activityLevel) {
    String _temp0 = intl.Intl.selectLogic(
      activityLevel,
      {
        'sedentary': 'غیرفعال و زیاد میشینم',
        'fairyActive': 'تقریبا فعال، هر هفته یکی دوبار ورزش میکنم و پیاده روی میکنم',
        'moderatelyActive': 'فعال، هر هفته دو سه روز ورزش میکنم',
        'active': 'خیلی فعال، هر هفته بیش از 3 بار با شدت بالا ورزش میکنم',
        'veryActive': 'روزی دوبار ورزش میکنم',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String profileChartTypeLabel(String chartType) {
    String _temp0 = intl.Intl.selectLogic(
      chartType,
      {
        'weight': 'وزن',
        'waistCircumference': 'دور کمر',
        'armCircumference': 'دور بازو',
        'chestCircumference': 'دور سینه',
        'thightCircumference': 'دور ران',
        'calfMuscleCircumference': 'ماهیچه ساق پا',
        'hipCircumference': 'دور باسن',
        'activityLevel': 'سطح فعالیت',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String profileChangeWeightSpeedButtonLabel(String changeWeightSpeed) {
    String _temp0 = intl.Intl.selectLogic(
      changeWeightSpeed,
      {
        'none': 'تثبیت وزن',
        'slowAndEasy': 'آهسته و آسان',
        'medium': 'طبیعی',
        'fastAndHard': 'سریع و سخت',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String get profileBodyShape => 'شکل بدن';

  @override
  String get mandetory => 'اختیاری';
}
