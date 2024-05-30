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
  String get foodDataCalariePerGramLabel => 'کیلوکالری در گرم';

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

  @override
  String appBmiStatus(String bmiStatus) {
    String _temp0 = intl.Intl.selectLogic(
      bmiStatus,
      {
        'underweight': 'کمبود وزن',
        'healthyWeight': 'عادی',
        'overweight': 'اضافه وزن',
        'obesClass1': 'چاقی کلاس 1',
        'obesClass2': 'چاقی کلاس 2',
        'obesClass3': 'چاقی کلاس 3',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String profileBmiDescription(double bmiValue, String bmiDescriptive) {
    final intl.NumberFormat bmiValueNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String bmiValueString = bmiValueNumberFormat.format(bmiValue);

    return 'شاخص توده بدنی شما $bmiValueString و در وضعیت $bmiDescriptive هستید.';
  }

  @override
  String profileWaistCircumferenceDescription(double ratio) {
    final intl.NumberFormat ratioNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 2
    );
    final String ratioString = ratioNumberFormat.format(ratio);

    return 'شاخص دور کمر به قد از شاخص توده بدنی برای ارزیابی خطرات مرتبط با سلامت دقیق‌تر است و این نسبت برای شما $ratioString است، این نسبت هرچه به صفر نزدیک تر باشد وضعیت خطرات مرتبط با سلامتی برای شما کمتر میشود.';
  }

  @override
  String get profileBmiWaistCircumferenceHealthDescription => 'خطرات مرتبط با سلامتی شامل بیماری های قلبی عروقی، بیماری کیسه صفرا، فشار خون بالا و دیابت نوع 2 میباشد.';

  @override
  String profileUserDescriptionProtein1(String weeklyActivitylevel) {
    return 'مقدار پروتئین مورد نیاز با سطح فعالیت $weeklyActivitylevel';
  }

  @override
  String profileUserDescriptionProtein2(double dailyProteinValueRestDay, double gramPerBodyWeightRestDay) {
    final intl.NumberFormat dailyProteinValueRestDayNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String dailyProteinValueRestDayString = dailyProteinValueRestDayNumberFormat.format(dailyProteinValueRestDay);
    final intl.NumberFormat gramPerBodyWeightRestDayNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 2
    );
    final String gramPerBodyWeightRestDayString = gramPerBodyWeightRestDayNumberFormat.format(gramPerBodyWeightRestDay);

    return 'برای روز استراحت مقدار $dailyProteinValueRestDayString گرم پروتئین میشود. شما در روز استراحت به ازای هر کیلو وزن بدنتون به $gramPerBodyWeightRestDayString گرم پروتئین برای پیشگیری از تحلیل ماهیچه ها در سطح فعالیت فعلی نیاز دارید.';
  }

  @override
  String profileUserDescriptionProtein3(double dailyProteinValueRestDay) {
    final intl.NumberFormat dailyProteinValueRestDayNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String dailyProteinValueRestDayString = dailyProteinValueRestDayNumberFormat.format(dailyProteinValueRestDay);

    return 'و برای روز فعالیت بدنی و تمرین، مقدار $dailyProteinValueRestDayString گرم پروتئین برای عملکرد طبیعی و افزایش ماهیچه با اصل اضافه بار نیاز دارید.';
  }

  @override
  String get profileUserDescriptionProtein4 => 'به مقدار پروتئین مواد غذایی توجه کنید برای مثال هر 100 گرم سینه مرغ، فقط 31 گرم پروتئین دارد و الباقی آب و چربی و مواد دیگر است. ';

  @override
  String get profileEnergyDescriptionSleepAndStressTitle => 'استرس و خواب';

  @override
  String get profileEnergyDescriptionSleepAndStressSubtitle1 => 'استرس روزمره و کاری باعث افزایش هورمون کورتیزل و اضطراب میشود و پاسخ طبیعی و ساده معمولا خوردن قند و چربی و نمک زیاد برای افزایش هورمون دوپامین جهت خنثی کردن اضطراب و استرس است. ';

  @override
  String get profileEnergyDescriptionSleepAndStressSubtitle2 => 'در حالت استرس ، نفس عمیق بکشید و آب بخورید و ریشه مسئله را پیدا و حل کنید.';

  @override
  String get profileEnergyDescriptionSleepAndStressSubtitle3 => 'خواب کم و شب بیداری باعث افزایش کورتیزل و پرخوری میشود و خوردن زیاد قند و چربی ، بیشتر از انرژی مورد نیاز روزانتون، به شکل چربی در بدن جمع میشود . برای اینکه صبح زودتر بیدار شوید، شب 7 تا 8 ساعت زودتر بخوابید.';

  @override
  String get profileUserDescriptionCarbohydrate1 => 'استفاده از کربوهیدرات تصویه شده که سبوس و جوانه و پوسته غلات و فیبر و مواد مغذی و ویتامین آن برای نگهداری طولانی مدت جدا  میشود و فقط نشاسته داخل و نهان دانه باقی میماند را به حداقل برسانید  مثل برنج سفید ، بلغور ذرت، نان سفید، آرد سفید ، شیرینی و بیسکویت ، نوشیدینی شیرین، نوشیدنی ورزشی، شکلات، پاستا و ماکارانی.';

  @override
  String get profileUserDescriptionCarbohydrate2 => 'برای سیری طولانی مدت و افزایش سیستم ایمنی بدن و هضم ساده تر استفاده از کربوهیدرات سبوس و فیبر دار را بیشتر استفاده کنید.';

  @override
  String profileUserDescriptionCarbohydrate3(double carbohydrateValueInExerciseDay) {
    final intl.NumberFormat carbohydrateValueInExerciseDayNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String carbohydrateValueInExerciseDayString = carbohydrateValueInExerciseDayNumberFormat.format(carbohydrateValueInExerciseDay);

    return 'مقدار کربوهیدرات از نوع غنی مانند نون سنگک ، حبوبات، غلات سبوس دار در روزهای تمرین برای تامین ذخیره گلیکوژن $carbohydrateValueInExerciseDayString گرم است.';
  }

  @override
  String profileUserDescriptionCarbohydrate4(double carbohydrateValueInRestDay) {
    final intl.NumberFormat carbohydrateValueInRestDayNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String carbohydrateValueInRestDayString = carbohydrateValueInRestDayNumberFormat.format(carbohydrateValueInRestDay);

    return 'در روزهای غیرتمرین برای تامین ویتامین و مواد معدنی و فتوکمیکال یا آنتی اکسیدان ها برای بهبود و ریکاوری مقدار کربوهیدرات موردنیاز شما$carbohydrateValueInRestDayString  گرم است. این کربوهیدرات از نوع میوه‌ها و سبزی‌ها با بیشترین تنوع رنگ ها می باشند مانند سیب، کاهوپیچ و هویج .';
  }

  @override
  String get profileUserDescriptionFat1 => 'مقدار مصرف چربی مطابق با توصیه سازمان های بهداشت بزرگ جهانی و برنامه غذایی مدیترانیه و سبک آشپزی ایرانی 35 درصد انرژی روزانه است.';

  @override
  String get profileUserDescriptionFat2 => 'کاهش چربی باعث کاهش وزن و کاهش شاخص توده بدنی و دور کمر و افزایش اعتماد بنفس میشود.';

  @override
  String get profileUserDescriptionFat3 => 'بیشترین مقدار چربی سوزی  شما در 62 درصد تا 63 درصد مقدار VO2max شما اتفاق می‌افتد.';

  @override
  String selectedFoodsDailyActivityLevel(String dayActivityLevel) {
    String _temp0 = intl.Intl.selectLogic(
      dayActivityLevel,
      {
        'rest': 'روز استراحت',
        'moderate': 'روز تمرین',
        'other': 'ترجمه تعریف نشده',
      },
    );
    return '$_temp0';
  }

  @override
  String selectedFoodsListUserNutritionRequirement(String dailyActivityLevel, int calorie, double protein, double rabohydrateVegetable, double carbohydrateNonVegetable, double fat) {
    final intl.NumberFormat proteinNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 0
    );
    final String proteinString = proteinNumberFormat.format(protein);
    final intl.NumberFormat rabohydrateVegetableNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 0
    );
    final String rabohydrateVegetableString = rabohydrateVegetableNumberFormat.format(rabohydrateVegetable);
    final intl.NumberFormat carbohydrateNonVegetableNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 0
    );
    final String carbohydrateNonVegetableString = carbohydrateNonVegetableNumberFormat.format(carbohydrateNonVegetable);
    final intl.NumberFormat fatNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 0
    );
    final String fatString = fatNumberFormat.format(fat);

    return 'در $dailyActivityLevel انرژی مورد نیاز شما $calorie کیلوکالری و $proteinString گرم پروتئین و $rabohydrateVegetableString گرم کروبوهیدرات از نوع میوه و سبزی و $carbohydrateNonVegetableString گرم کربوهیدرات از نوع غنی و غلات و حبوبات و $fatString گرم چربی است.';
  }

  @override
  String get selectedFoodsListUserNutritionRestDayCarbohydrate1 => 'همه کربوهیدرات ها از شکر ساده درست شده اند.';

  @override
  String get selectedFoodsListUserNutritionRestDayCarbohydrate2 => 'شکر و قند نوعی کربوهیدرات هستند که از نیشکر و چغندر قند فراوری میشود و نوشیدن آن باعث پوسیدگی دندان میشود .برای مثال معمولا با چربی زیاد در شکلات و بیسکویت یا به با نمک زیاد به شکل چیپس فرآوری میشود.این غذاهای فراوری شده دارای انرژی زیاد و مواد مغذی و فیبر کمی است که باعث ایجاد گشنگی زودهنگام میشود.';

  @override
  String selectedFoodsListUserNutritionRestDayCarbohydrate3(int fivePercentCalorie, int sugarCubeCount) {
    return 'حداکثر 5 درصد انرژی روزانه شما یا $fivePercentCalorie کیلوکالری میتواند از شکر باشد. این مقدار شکر برای شما معادل حدودا $sugarCubeCount حبه قند می باشد که شامل شکر در غذا، شربت، آب میوه ، عسل می باشد و شامل شکر های موجود در شیر و سبزیجات و میوه ها نمیشود. ';
  }

  @override
  String get selectedFoodsListUserNutritionRestDayCarbohydrate4 => 'کربوهیدرات موجود در میوه از نوع فروکتوز است که مصرف زیاد آن برای افراد غیرفعال باعث افزایش تری گلیسیرید و چربی خون میشود ولی اگر ورزش کنید تاثیری در چربی خون ندارد. اگر ورزش هم نمیکنید حداقل روزانه 2 تا 3 واحد میوه بخورید زیرا میوه شامل آب برای آبرسانی به بدن و فیبر برای افزایش سیستم ایمنی و فتوکمیکال برای جلوگیری از التهاب اکسیدان ها(مولکول های دارای یک اتم اکسیژن فعال) می باشد.';

  @override
  String selectedFoodsListUserNutritionRestDayProtein1(int proteinPerMeal) {
    return 'سعی کنید هر 3 ساعت در 5 وعده و هر وعده به مقدار مساوی و منظم حدود $proteinPerMeal گرم در هر وعده پروتئین بخورید*. پروتئین باعث سیری طولانی مدت تر نسبت به کربوهیدرات میشود و در کنار غلات سبوس دار و حبوبات فیبر دار باعث سیری و کاهش اشتها در روز میشود . 30 درصد از پروتئین را از منبع شیر و محصولات لبنی تامین کنید که همزمان غنی از کلسیم هستند. ';
  }

  @override
  String get selectedFoodsListUserNutritionRestDayProtein2 => 'تمام پروتئین های حیوانی مانند شیر و گوشت با کیفیت هستند. اگر 9 آمینو اسید ضروری در ماده غذایی تقریبا به اندازه نیاز بدن باشد به آنها پروتئین با کیفیت بالا میگیم، به همین خاطر بین مواد غذایی گیاهی ، سویا(شیر و ماست سویا) ، گندم سیاه، دانه کینوا، دانه چیا و دانه کنف یا شاهدانه غذای گیاهی شامل پروتئین با کیفیت بالا هستند.';

  @override
  String get selectedFoodsListUserNutritionRestDayProtein3 => 'همچنین لوبیا، عدس، نخود، غلات و آجیل ها شامل برخی آمینو اسید های ضروری هستند که میتوانید با خوردن ترکیبی ازین مواد غذایی نیاز بدن به امینو اسید های ضروری را در 24 ساعت تامین کنید.برای مثال خوردن لوبیا و برنج و آجیل هر 9 آمینو اسید ضروری را تامین میکنند.';

  @override
  String selectedFoodsListUserNutritionRestDayProtein4(double proteinPerBodyWeight) {
    final intl.NumberFormat proteinPerBodyWeightNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String proteinPerBodyWeightString = proteinPerBodyWeightNumberFormat.format(proteinPerBodyWeight);

    return 'پروتئین با مقدار جذب بیشتر از روده بزرگ و امتیاز بیشتر DIAAS : شیر و تخم مرغ و سویا و محصولات سویا و نخود  وعدس سبز و لوبیا سیاه و بادام زمینی و برنج سفید هستند. شما روزانه به $proteinPerBodyWeightString گرم پروتئین به ازای هر کیلو از وزن بدنتون نیاز دارید تا با توجه به سطح فعالیت هفتگی و سرعت کاهش وزن عضله‌های خود را حفظ و افزایش دهید.';
  }

  @override
  String get selectedFoodsListUserNutritionRestDayProtein5 => '*مبتدیان مقدار پروتئین بیشتری نسبت به ورزشکار حرفه ای نیاز دارند ( تا 3 هفته اول 40 درصد بیشتر از افراد حرفه ای هست)';

  @override
  String get selectedFoodsListUserNutritionRestDayProtein6 => 'اگر به اندازه کافی پروتئین بخورید میتوانید بدون ورزش و با حداقل کاهش ماهیچه ، چربی کم کنید.';

  @override
  String get selectedFoodsListUserNutritionRestDayProtein7 => 'برای سرعت بیشتر و خوش اندام شدن و افزایش ماهیچه و پرورش اندام میتوانید ورزش کنید';

  @override
  String get selectedFoodsListUserNutritionRestDayFat1 => 'چربی بیشترین مقدار انرژی را بین مواد غذایی دارد و به راحتی در خوردن آن زیاده روی میشود. برای مثال انرژی یک قاشق غذاخوری روغن، 9 کیلوکالری ضربدر 15 گرم یا 135 کیلو کالری در هر قاشق غذاخوری است پس به مقدار روغن دقت کنید.';

  @override
  String get selectedFoodsListUserNutritionRestDayFat2 => '35 درصد انرژی روزانه از چربی ها تامین میشود و شامل 3 قسمت زیر است : ';

  @override
  String get selectedFoodsListUserNutritionRestDayFat3 => ' 10 درصد چربی اشباع (معمولا جامد و نیمه جامد در دمای اتاق) : روغن گیاهی مانند پالم و نارگیل و کاکائو و روغن با منشا حیوانی مانند دمبه، چربی بین بافت ماهیچه و گوشت و کره و موارد مشابه.';

  @override
  String get selectedFoodsListUserNutritionRestDayFat4 => 'چربی های موجود در محصولات لبنی بخاطر شکل ساختاری مولکول های چربی شیر ، کلسترول خون را بالا نمی برد و بیماری فلبی عروقی ندارند و مقداری از چربی غیراشباع آن بخاطر ترکیب با کلسیم جذب بدن نمیشود.';

  @override
  String get selectedFoodsListUserNutritionRestDayFat5 => 'حداکثر 12 درصد چربی غیراشباع تک (معمولا مایع در دمای اتاق) : روغن زیتون ، روغن کلزا، روغن آفتابگردان و بادام زمینی، روغن فندق و بادام، آووکادو، زیتون، آجیل و دانه ها است.';

  @override
  String get selectedFoodsListUserNutritionRestDayFat6 => 'حداقل 13 درصد چربی غیراشباع چند (معمولا مایع در دمای اتاق) باشد : امگا 3 از نوع بلند EPAو DHA تنها به مقدار زیاد در ماهی چرب شامل قزل آلا و سالمون و خالی مخالی و به مقدار کمی در ماهی تن موجود است است . حداقل ماهی یک بارماهی چرب بخورید. روغن کلزا با نسبت 2 به 1 دارای امگا 6 و امگا 3 است و نقطه دود 170 درجه سانتی گراد دارد که مناسب پخت و پز می باشد.';

  @override
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral1 => 'با مصرف میوه و سبزی با رنگ هاب مختلف در روز استراحت معمولا نیاز به ویتامین و مواد معدنی تامین میشود و برای تشخصی کمبود ویتامین و مواد معدنی به پزشک مراجعه کنید.';

  @override
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral2 => 'مصرف آهن برای انتقال اکسیژن در خون و مایچه مهم هست (هموگلوبین و میوگلوبین) . بعد از تمرین بخاطر اثر التهاب ، سطح هرمون تنظیم آهن یعنی هپسیدین به مدت 3 تا 6 ساعت بعد تمرین زیاد میشه و جذب آهن کاهش پیدا میکنه و آهن در این مدت شاید جذب نشود.';

  @override
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral3 => 'در صبح میزان هرمون هپسیدین در کمترین مقدار هست و آهن بهتر هست در صبح خورده بشه مثل املت اسفناج یا جگر که جذب را حداکثر میکند. جذب آهن با مصرف ویتامین سی مانند پرتقال افزایش پیدا میکنه.';

  @override
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral4 => 'غذاهای غنی از آهن عبارتند از گوشت و کله پاچه، ساردین، ماهی تن، غلات سبوس دار، زرده تخم مرغ، لوبیا، عدس، سبزیجات برگ سبز، زردآلو خشک، آجیل و دانه ها. ';

  @override
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral5 => 'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.';

  @override
  String get selectedFoodsListUserNutritionRestDayHydration1 => 'خوردن آب قبل وعده غذایی باعث میشه زودتر سیر بشید و احساس رضایت داشته باشید ولی روی بعد از غذا تاثیری نداره و امکان داره بخاطر دریافت نکردن کالری کمتر برای وعده بعدی زودتر گرسنه شوید.';

  @override
  String get selectedFoodsListUserNutritionRestDayHydration2 => 'در بین غذاهای سفت مثل غذای برنجی و نانی خوردن آب باعث کمک به هضم غذا میشه و در بین غذاهای آبکی نیاز نیست . خوردن خیلی زیاد آب باعث میشه شیره معده رقیق بشه پس همراه غذای خیلی آبکی آب ننوشید. بخاطر ماهیچه بودن معده و امکان انقباض و انبساط آن خوردن آب با برنج یا نان و دیگر مواد غذایی باعث بزرگ شدن معده نمیشود و معده بعد از تخلیه به اندازه قبلی بازمیگردد.';

  @override
  String get selectedFoodsListUserNutritionRestDayHydration3 => 'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.';

  @override
  String selectedFoodsListUserNutritionRestDayHydration4(double waterVolume) {
    final intl.NumberFormat waterVolumeNumberFormat = intl.NumberFormat.decimalPatternDigits(
      locale: localeName,
      decimalDigits: 1
    );
    final String waterVolumeString = waterVolumeNumberFormat.format(waterVolume);

    return 'اگر در منطقه معتدل آب و هوایی زندگی میکنید خوردن حداقل $waterVolumeString لیتر آب برای شما نیاز است مهم نیست آب از دمنوش و چای و قهوه یا آب میوه یا نوشیدنی انرژی باشد. هرچه محیط گرم تر باشد آب بیشتری نیاز دارید و برعکس.';
  }

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein1 => 'غذای پروتئینی و تمرین مقاوتی مایچه میسازد و ماهیچه بیشتر باعث افزایش نرخ سوخت و ساز و سرعت بیشتر کاهش وزن همزمان با افزایش اعتماد بنفس و پرورش اندام میشود. ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein2 => 'برای مایچه سازی پروتئین با کیفیت شامل لوسین که سریع هضم و جذب میشود لازم است . برای حداکثر مایچه سازی باید باید محدوده آستانه لوسین رد بشه که شامل 2 تا 3 گرم لوسین در هر وعده میشود.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3 => 'مواد غذایی زیر دارای 2 تا 3 گرم لوسین است که بعد از تمرین به همراه کربوهیدرات برای حداکثر ماهیچه سازی بهتر است استفاده کنید';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine1 => '600 میلی لیتر شیر کامل';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine2 => '85 گرم پنیر چدار';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine3 => '450 گرم ماست ساده';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine4 => '4 تا تخم مرغ (یک زرده و 4 سفیده توصیه میشه )';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine5 => '85 گرم گوشت قرمز یا گوشت پرنده';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine6 => '100 گرم ماهی';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine7 => '17 گرم پودر پروتئین وی';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine8 => '400 گرم لوبیا یا عدس پخته شده';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein4 => 'شیر شامل آب و پروتئین و کربوهیدرات و مواد مغذی است که آن را برای بهبود ماهیچه بعد از تمرین گزینه عالی میکند زیرا باعث تامین ذخیره گلیکوژن و ترکیب پروتئین برای ساخت ماهیچه و آب رسانی به بدن میشود. تفاوتی ندارد به شکل شیر کم چرب یا پرچرب باشد یا به شکل شیر قهوه یا شیر کاکائو یا با مزه های متفاوت میل کنید.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayProtein5 => 'برای ریکاوری و مایچه سازی آخر شب مواد حاوی Casein یا کازین مثل شیر یا ماست یا مکمل میل کنید. پرتئین به شما احساس پر بودن و سیری طولانی مدت و خواب عمیق تر میدهد.';

  @override
  String selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate1(int weight, int carbohydrate, int protein) {
    return 'زمان و مقدار مصرف کربوهیدرات قبل از تمرین باهم در ارتباط است به صورت کلی 1 تا 4 گرم کربوهیدرات به ازای هر کیلو وزن بدن از 1 تا 4 ساعت مانده به تمرین میتونید مصرف کنید. برای مثال با وزن $weight کیلویی شما اگر 2 ساعت به شروع تمرین باقی مانده میتوانید $carbohydrate گرم کربوهیدرات به همراه $protein گرم پروتئین با کیفیت بخورید.';
  }

  @override
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate2 => 'مصرف کربوهیدرات 1 تا 4 ساعت قبل از تمرین باعث افزایش ذخیره گلیکوژن و افزایش کارایی تمرین میشود. خوردن کربوهیدرات تا 2 ساعت قبل تمرین زمان کافی برای هضم و جذب آن را میدهد. ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate3 => 'اگر نزدیک به زمان تمرین غذا بخورید امکان دارد غذا خوردن باعث سوهاضمه و ناراحتی معده شود زیرا در زمان تمرین تمرکز جریان خون از معده به سمت عظله های هدف می رود تا اکسیژن را از طریق جریان خون به عظله ها برساند.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate4 => 'مصرف کربوهیدرات 1 تا 4 ساعت قبل از تمرین باعث افزایش ذخیره گلیکوژن و افزایش کارایی تمرین میشود. خوردن کربوهیدرات تا 2 ساعت قبل تمرین زمان کافی برای هضم و جذب آن را میدهد. ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate5 => 'اگر ناراحتی معده و سوهاضمه احساس کردید سعی کنید 2 ساعت قبل شروع تمرین یک میان وعده سبک و ساده با کربوهیدرات با جی آی بالا مثل موز یا هر میوه تازه یا میوه خشک شده و یک مشت آجیل بخورید یا نان و کره مغزیجات مثل کره پسته یا بادام زمینی بخورید یا فرنی یا جودوسر و شیر(انواع اوتمیل) بخورید.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate1 => 'تا قبل از 45 دقیقه تمرین بجز اب چیزی نیاز نیست بخورید زیرا در طول این زمان خالی شدن ذخیره گلیکوژن محتمل نیست . ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate2 => 'برای تمرین های بین 45 تا 75 دقیقه میتونید کربوهیدرات شیرین بمکید و بچشید تا همزمان پیام خستگی به مغز را مسدود کنید و از مشکلات گوارشی اگر برای شما خوردن هنگام تمرین سخت است جلوگیری کنید. ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate3 => 'برای تمرین های بیشتر از 1 ساعت به ازای هر ساعت میتوانید 30 تا 60 گرم کربوهیدرات با توجه به شدت تمرین مصرف کنید. زیرا بدن نمیتواند بیشتر از 1 گرم گلوکوز در هر دقیقه در مایچه با اکسیژن ترکیب کند، مصرف بیشتر از 60 گرم کربوهیدرات باعث مشکلات گوارشی میشود و منفعتی نیز ندارد. ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate4 => 'حدود 15 تا 20 دقیقه طول میگشد تا کربوهیدرات خورده شده به مایچه برسد، بنابراین قبل از شروع خستگی میان وعده تمرین را بخورید. معمولا هر 20 تا 30 دقیقه بین تمرین میتونید کربوهیدرات بخورید .';

  @override
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate5 => '3 نمونه از میان وعده های تمرین شامل یک عدد موز، دو عدد خرما یا یک عدد انبه میشود، هر کدام 30 گرم کربوهیدرات دارد و اگر شدت تمرین بیشتر از تا دوبرابر این مقدار میتواند بخورید.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate1 => 'گلیکوژن تخلیه شده در زمان تمرین باید برای تمرین روزهای بعدی تامین شود وگرنه روز تمرین بعدی باعث کاهش کارایی تمرین شما میشود. ';

  @override
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate2 => 'در 2 ساعت بعد از تمرین تا 150 درصد بیشتر از جالت عادی گلیکوژن ذخیره میشود.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate4 => 'اینکه در 2 ساعت اول مقدار بیشتری گلوکوز جذب میشود دو دلیل دارد اول اینکه با خوردن کربوهیدرات مقدار گلوکوز بیشتری در خون برای تامین تولید گلیکوژن در ماهیچه ها است و دوم اینکه غشای سلولی نفوذپذیری بیشتری برای دریافت گلوکوز نسبت به حالت عادی دارد.';

  @override
  String selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate5(int carbohydrateValu1, int carbohydrateValu2) {
    return 'تا 4 ساعت بعد از تمرین به ازای هر کیلو وزن بدن میتونید 1 تا 1.2 گرم کربوهیدرات در هرساعت بخورید که معادل $carbohydrateValu1 تا $carbohydrateValu2 گرم کربوهیدرات در هر ساعت میشود. این حداکثر مقدار کربوهیدرات است که در هر ساعت سیستم گوارش میتواند هضم کند.';
  }

  @override
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate6 => 'کربوهیدرات را حتما با پروتئین با کیفیت شامل لوسین برای حداکثررساندن ماهیچه سازی و تامین گلیکوژن میل کنید.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate7 => 'خوردن پروتئین به همراه کربوهیدرات باعث ترشح بیشتر انسولین نسبت به زمانی که فقط کربوهیدرات میخورید میشود. افزایش انسولین باعث افزایش مقدار و افزایش سرعت جذب گلوکوز و آمینواسید پروتئین توسط سلول ماهیچه ها میشود. مقدار بیشتر انسولین باعث کاهش سطح کورتیزل میشود و در نتیجه ترکیب پروتئین برای ساخت ماهیچه افزایش میابد.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate8 => 'همچنین وجود پروتئین در وعده غذایی باعث ساخت پروتئین و کاهش شکستن پروتئین و موجود بودن پروتئین بیشتر در ماهیچه ها برای ترمیم بعد از تمرین میشود که منجر به ماهیچه سازی بیشتر میشود.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayHydration1 => 'معمولا در تمرین بین 0.5 تا 2.5 لیتر آب به عرق تبدیل میشود. وقتی مقدار آب بدن کم باشد وهایپوهیدرشن اتفاق بیافتد حجم خون کم میشه و غلظت خون بالا میرود و قلب باید سخت تر کار کند تا فشار خون افزایش پیدا کند و در نتیجه فشار اضافی به قلب و شش و سیستم خون رسانی وارد میشود.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayHydration2 => 'کم ابی یا هایپوهیدراشن به روزهای قبل و تمرین های قبلی بستگی داره و کم آبی امروز روی تمرین فردا تاثیر میگذارد.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayHydration3 => 'بهترین راه نوشیدن مقدار مناسب آب در روز، نگاه کردن به رنگ اوره ادرار و مقایسه آن با جدول رنگ اوره است.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayHydration4 => 'به صورت چشمی باید ادرار رقیق و رنگ پریده باشه و رنگ تیره و حجم کم یعنی آب بدن کم هست و باید قبل تمرین بیشتر بنوشید. ';

  @override
  String selectedFoodsListUserNutritionExerciseDayHydration5(int fiveTimeWeight, int tenTimeWeight) {
    return 'با وزن شما خوردن $fiveTimeWeight تا $tenTimeWeight میلی لیتر آب 2 تا 4 ساعت قبل تمرین مناسب است، واگر باعث نشد ادرار کنید یا رنگ ادرار تیره بود باید بیشتر آب بنوشید.';
  }

  @override
  String get selectedFoodsListUserNutritionExerciseDayHydration6 => 'آب را بعد از تمرین را در چند وعده میل کنید تا حجم خون یکباره زیاد نشود زیرا باعث ادرار و کم آب ماندن بدن میشود.';

  @override
  String get selectedFoodsListUserNutritionExerciseDayHydration7 => 'آب را بعد از تمرین اگر زیاد عرق کردید با نمک یا طعم دهنده بخورید . مشکل مصرف آب خالی این هست که باعث کاهش غلظت خون میشود و از طرفی احساس تشنگی رو کم میکند ولی از طرفی باعث ادرار میشود و در نتیجه باعث میشه قبل اینکه سیراب بشید از نوشیدن آب دست بکشید.';
}
