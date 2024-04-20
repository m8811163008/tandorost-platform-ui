import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'component_library_localizations_fa.dart';

/// Callers can lookup localized strings with an instance of ComponentLibraryLocalizations
/// returned by `ComponentLibraryLocalizations.of(context)`.
///
/// Applications need to include `ComponentLibraryLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/component_library_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ComponentLibraryLocalizations.localizationsDelegates,
///   supportedLocales: ComponentLibraryLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ComponentLibraryLocalizations.supportedLocales
/// property.
abstract class ComponentLibraryLocalizations {
  ComponentLibraryLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ComponentLibraryLocalizations of(BuildContext context) {
    return Localizations.of<ComponentLibraryLocalizations>(context, ComponentLibraryLocalizations)!;
  }

  static const LocalizationsDelegate<ComponentLibraryLocalizations> delegate = _ComponentLibraryLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fa')
  ];

  /// No description provided for @foodSelectionScreenTextFieldHint.
  ///
  /// In fa, this message translates to:
  /// **'جستجوی غذا'**
  String get foodSelectionScreenTextFieldHint;

  /// No description provided for @uomCardHomanyGramsLable.
  ///
  /// In fa, this message translates to:
  /// **'گِرم'**
  String get uomCardHomanyGramsLable;

  /// No description provided for @foodTimeInputDateTimeLabelText.
  ///
  /// In fa, this message translates to:
  /// **'{timeStatus, select, past{کی خوردید؟} now{کی خوردید؟} future{کی میخورید؟} other{ترجمه تعریف نشده}}'**
  String foodTimeInputDateTimeLabelText(String timeStatus);

  /// No description provided for @foodTimeInputDateTimeLabelVelue.
  ///
  /// In fa, this message translates to:
  /// **'{timeStatus, select, past{ساعت پیش} now{الان} future{ساعت دیگر} other{ترجمه تعریف نشده}}'**
  String foodTimeInputDateTimeLabelVelue(String timeStatus);

  /// No description provided for @nutritionDataFatLabel.
  ///
  /// In fa, this message translates to:
  /// **'چربی'**
  String get nutritionDataFatLabel;

  /// No description provided for @nutritionDataCarbohydrateLabel.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات'**
  String get nutritionDataCarbohydrateLabel;

  /// No description provided for @nutritionDataProteinLabel.
  ///
  /// In fa, this message translates to:
  /// **'پروتئین'**
  String get nutritionDataProteinLabel;

  /// No description provided for @foodDataCalarieLabel.
  ///
  /// In fa, this message translates to:
  /// **'کیلوکالری'**
  String get foodDataCalarieLabel;

  /// No description provided for @foodDataCalariePerGramLabel.
  ///
  /// In fa, this message translates to:
  /// **'کیلوکالری در گرم'**
  String get foodDataCalariePerGramLabel;

  /// No description provided for @foodDataPercentValue.
  ///
  /// In fa, this message translates to:
  /// **'{value}'**
  String foodDataPercentValue(double value);

  /// No description provided for @unitOfMeasurementTitle.
  ///
  /// In fa, this message translates to:
  /// **'{uomType, select, grams{گرم} tableSpoon{قاشق غذاخوری} calorie{کیلوکالری} gramsPerUnit{عدد متوسط} other{ترجمه تعریف نشده}}'**
  String unitOfMeasurementTitle(String uomType);

  /// No description provided for @selectedFoodTileEatDateValue.
  ///
  /// In fa, this message translates to:
  /// **'در ساعت {timeValue} و تاریخ {dateValue}'**
  String selectedFoodTileEatDateValue(String timeValue, String dateValue);

  /// No description provided for @selectCustomDateTimeRangeDialogTitle.
  ///
  /// In fa, this message translates to:
  /// **'انتخاب تاریخ'**
  String get selectCustomDateTimeRangeDialogTitle;

  /// No description provided for @selectCustomDateTimeRangeDialogFromDate.
  ///
  /// In fa, this message translates to:
  /// **'از تاریخ'**
  String get selectCustomDateTimeRangeDialogFromDate;

  /// No description provided for @selectCustomDateTimeRangeDialogFromTime.
  ///
  /// In fa, this message translates to:
  /// **'از ساعت'**
  String get selectCustomDateTimeRangeDialogFromTime;

  /// No description provided for @selectCustomDateTimeRangeDialogToDate.
  ///
  /// In fa, this message translates to:
  /// **'تا تاریخ'**
  String get selectCustomDateTimeRangeDialogToDate;

  /// No description provided for @selectCustomDateTimeRangeDialogToTime.
  ///
  /// In fa, this message translates to:
  /// **'تا ساعت'**
  String get selectCustomDateTimeRangeDialogToTime;

  /// No description provided for @buttonConfirmText.
  ///
  /// In fa, this message translates to:
  /// **'تایید'**
  String get buttonConfirmText;

  /// No description provided for @buttonCancleText.
  ///
  /// In fa, this message translates to:
  /// **'لغو'**
  String get buttonCancleText;

  /// No description provided for @filterSelectedFoodsSelectDateTimeOptionRow1.
  ///
  /// In fa, this message translates to:
  /// **'از دیشب ساعت 00:00'**
  String get filterSelectedFoodsSelectDateTimeOptionRow1;

  /// No description provided for @filterSelectedFoodsSelectDateTimeOptionRow2.
  ///
  /// In fa, this message translates to:
  /// **'از الان تا 7 روز پیش'**
  String get filterSelectedFoodsSelectDateTimeOptionRow2;

  /// No description provided for @filterSelectedFoodsSelectDateTimeOptionRow3.
  ///
  /// In fa, this message translates to:
  /// **'انتخاب بازه زمانی'**
  String get filterSelectedFoodsSelectDateTimeOptionRow3;

  /// No description provided for @selectedFoodListBannerLabelEnergy.
  ///
  /// In fa, this message translates to:
  /// **'جمع ⚡️'**
  String get selectedFoodListBannerLabelEnergy;

  /// No description provided for @profileHeight.
  ///
  /// In fa, this message translates to:
  /// **'قد'**
  String get profileHeight;

  /// No description provided for @profileWeight.
  ///
  /// In fa, this message translates to:
  /// **'وزن'**
  String get profileWeight;

  /// No description provided for @profileWaistCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور کَمر'**
  String get profileWaistCircumference;

  /// No description provided for @profileArmCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور بازو'**
  String get profileArmCircumference;

  /// No description provided for @profileChestCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور سینه'**
  String get profileChestCircumference;

  /// No description provided for @profileThightCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور ران'**
  String get profileThightCircumference;

  /// No description provided for @profileCalfMuscleCircumference.
  ///
  /// In fa, this message translates to:
  /// **'دور ماهیچه ساق پا'**
  String get profileCalfMuscleCircumference;

  /// No description provided for @profileBirthday.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ تولد'**
  String get profileBirthday;

  /// No description provided for @profileUsername.
  ///
  /// In fa, this message translates to:
  /// **'نام کاربری'**
  String get profileUsername;

  /// No description provided for @profileGender.
  ///
  /// In fa, this message translates to:
  /// **'جنسیت'**
  String get profileGender;

  /// No description provided for @profileTarget.
  ///
  /// In fa, this message translates to:
  /// **'چند روز دیگر شروع میکنید؟'**
  String get profileTarget;

  /// No description provided for @profileActiviyLevel.
  ///
  /// In fa, this message translates to:
  /// **'مقدار فعالیت'**
  String get profileActiviyLevel;

  /// No description provided for @profileCentiMetre.
  ///
  /// In fa, this message translates to:
  /// **'سانتی متر'**
  String get profileCentiMetre;

  /// No description provided for @profileKiloGrams.
  ///
  /// In fa, this message translates to:
  /// **'کیلوگرم'**
  String get profileKiloGrams;

  /// No description provided for @profileMale.
  ///
  /// In fa, this message translates to:
  /// **'آقا'**
  String get profileMale;

  /// No description provided for @profileFemail.
  ///
  /// In fa, this message translates to:
  /// **'خانم'**
  String get profileFemail;

  /// No description provided for @profileAgeText.
  ///
  /// In fa, this message translates to:
  /// **'{year} سال '**
  String profileAgeText(String year);

  /// No description provided for @profileActivityLevelButtonLabel.
  ///
  /// In fa, this message translates to:
  /// **'{activityLevel, select, sedentary{غیرفعال و زیاد میشینم} fairyActive{تقریبا فعال، هر هفته یکی دوبار ورزش میکنم و پیاده روی میکنم} moderatelyActive{فعال، هر هفته دو سه روز ورزش میکنم} active{خیلی فعال، هر هفته بیش از 3 بار با شدت بالا ورزش میکنم} veryActive{روزی دوبار ورزش میکنم} other{ترجمه تعریف نشده}}'**
  String profileActivityLevelButtonLabel(String activityLevel);

  /// No description provided for @profileChartTypeLabel.
  ///
  /// In fa, this message translates to:
  /// **'{chartType, select, weight{وزن} waistCircumference{دور کمر} armCircumference{دور بازو} chestCircumference{دور سینه} thightCircumference{دور ران} calfMuscleCircumference{ماهیچه ساق پا} hipCircumference{دور باسن} activityLevel{سطح فعالیت} other{ترجمه تعریف نشده}}'**
  String profileChartTypeLabel(String chartType);

  /// No description provided for @profileChangeWeightSpeedButtonLabel.
  ///
  /// In fa, this message translates to:
  /// **'{changeWeightSpeed, select, none{تثبیت وزن} slowAndEasy{آهسته و آسان} medium{طبیعی} fastAndHard{سریع و سخت}  other{ترجمه تعریف نشده}}'**
  String profileChangeWeightSpeedButtonLabel(String changeWeightSpeed);

  /// No description provided for @profileBodyShape.
  ///
  /// In fa, this message translates to:
  /// **'شکل بدن'**
  String get profileBodyShape;

  /// No description provided for @mandetory.
  ///
  /// In fa, this message translates to:
  /// **'اختیاری'**
  String get mandetory;

  /// No description provided for @appBmiStatus.
  ///
  /// In fa, this message translates to:
  /// **'{bmiStatus, select, underweight{کمبود وزن} healthyWeight{عادی} overweight{اضافه وزن} obesClass1{چاقی کلاس 1} obesClass2{چاقی کلاس 2} obesClass3{چاقی کلاس 3} other{ترجمه تعریف نشده}}'**
  String appBmiStatus(String bmiStatus);

  /// No description provided for @profileBmiDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص توده بدنی شما {bmiValue} و در وضعیت {bmiDescriptive} هستید.'**
  String profileBmiDescription(double bmiValue, String bmiDescriptive);

  /// No description provided for @profileWaistCircumferenceDescription.
  ///
  /// In fa, this message translates to:
  /// **'شاخص دور کمر به قد دقیق تر از شاخص توده بدنی برای سلامت است و این نسبت برای شما {ratio} است، هرچه به صفر نزدیک تر باشد و از یک دورتر باشد وضعیت خطرات مرتبط با سلامتی برای شما کمتر است.'**
  String profileWaistCircumferenceDescription(double ratio);

  /// No description provided for @profileBmiWaistCircumferenceHealthDescription.
  ///
  /// In fa, this message translates to:
  /// **'خطرات مرتبط با سلامتی مثل بیماری های قلبی عروقی، بیماری کیسه صفرا، فشار خون بالا و دیابت نوع 2 میباشد. برای پیشگیری از خطر، وزن خود را در بازه سالم تثبیت کنید.'**
  String get profileBmiWaistCircumferenceHealthDescription;

  /// No description provided for @profileUserDescriptionProtein1.
  ///
  /// In fa, this message translates to:
  /// **'مقدار پروتئین مورد نیاز با سطح فعالیت {weeklyActivitylevel}'**
  String profileUserDescriptionProtein1(String weeklyActivitylevel);

  /// No description provided for @profileUserDescriptionProtein2.
  ///
  /// In fa, this message translates to:
  /// **'برای روز استراحت مقدار {dailyProteinValueRestDay} گرم پروتئین میشود. شما در روز استراحت به ازای هر کیلو وزن بدنتون به {gramPerBodyWeightRestDay} گرم پروتئین برای پیشگیری از تحلیل ماهیچه ها در سطح فعالیت فعلی نیاز دارید.'**
  String profileUserDescriptionProtein2(double dailyProteinValueRestDay, double gramPerBodyWeightRestDay);

  /// No description provided for @profileUserDescriptionProtein3.
  ///
  /// In fa, this message translates to:
  /// **'و برای روز فعالیت بدنی و تمرین، مقدار {dailyProteinValueRestDay} گرم پروتئین برای عملکرد طبیعی و افزایش ماهیچه با اصل اضافه بار نیاز دارید.'**
  String profileUserDescriptionProtein3(double dailyProteinValueRestDay);

  /// No description provided for @profileUserDescriptionProtein4.
  ///
  /// In fa, this message translates to:
  /// **'به مقدار پروتئین مواد غذایی توجه کنید برای مثال هر 100 گرم سینه مرغ، فقط 31 گرم پروتئین دارد و الباقی آب و چربی و مواد دیگر است. '**
  String get profileUserDescriptionProtein4;

  /// No description provided for @profileEnergyDescriptionSleepAndStressTitle.
  ///
  /// In fa, this message translates to:
  /// **'استرس و خواب'**
  String get profileEnergyDescriptionSleepAndStressTitle;

  /// No description provided for @profileEnergyDescriptionSleepAndStressSubtitle1.
  ///
  /// In fa, this message translates to:
  /// **'استرس روزمره و کاری باعث افزایش هورمون کورتیزل و اضطراب میشود و پاسخ طبیعی و ساده معمولا خوردن قند و چربی و نمک زیاد برای افزایش هورمون دوپامین جهت خنثی کردن اضطراب و استرس است. '**
  String get profileEnergyDescriptionSleepAndStressSubtitle1;

  /// No description provided for @profileEnergyDescriptionSleepAndStressSubtitle2.
  ///
  /// In fa, this message translates to:
  /// **'در حالت استرس ، نفس عمیق بکشید و آب بخورید و ریشه مسئله را پیدا و حل کنید.'**
  String get profileEnergyDescriptionSleepAndStressSubtitle2;

  /// No description provided for @profileEnergyDescriptionSleepAndStressSubtitle3.
  ///
  /// In fa, this message translates to:
  /// **'خواب کم و شب بیداری باعث افزایش کورتیزل و پرخوری میشود و خوردن زیاد قند و چربی ، بیشتر از انرژی مورد نیاز روزانتون، به شکل چربی در بدن جمع میشود . برای اینکه صبح زودتر بیدار شوید، شب 7 تا 8 ساعت زودتر بخوابید.'**
  String get profileEnergyDescriptionSleepAndStressSubtitle3;

  /// No description provided for @profileUserDescriptionCarbohydrate1.
  ///
  /// In fa, this message translates to:
  /// **'استفاده از کربوهیدرات تصویه شده که سبوس و جوانه و پوسته غلات و فیبر و مواد مغذی و ویتامین آن برای نگهداری طولانی مدت جدا  میشود و فقط نشاسته داخل و نهان دانه باقی میماند را به حداقل برسانید  مثل برنج سفید ، بلغور ذرت، نان سفید، آرد سفید ، شیرینی و بیسکویت ، نوشیدینی شیرین، نوشیدنی ورزشی، شکلات، پاستا و ماکارانی.'**
  String get profileUserDescriptionCarbohydrate1;

  /// No description provided for @profileUserDescriptionCarbohydrate2.
  ///
  /// In fa, this message translates to:
  /// **'برای سیری طولانی مدت و افزایش سیستم ایمنی بدن و هضم ساده تر استفاده از کربوهیدرات سبوس و فیبر دار را بیشتر استفاده کنید.'**
  String get profileUserDescriptionCarbohydrate2;

  /// No description provided for @profileUserDescriptionCarbohydrate3.
  ///
  /// In fa, this message translates to:
  /// **'مقدار کربوهیدرات از نوع غنی مانند نون سنگک ، حبوبات، غلات سبوس دار در روزهای تمرین برای تامین ذخیره گلیکوژن {carbohydrateValueInExerciseDay} گرم است.'**
  String profileUserDescriptionCarbohydrate3(double carbohydrateValueInExerciseDay);

  /// No description provided for @profileUserDescriptionCarbohydrate4.
  ///
  /// In fa, this message translates to:
  /// **'در روزهای غیرتمرین برای تامین ویتامین و مواد معدنی و فتوکمیکال یا آنتی اکسیدان ها برای بهبود و ریکاوری مقدار کربوهیدرات موردنیاز شما{carbohydrateValueInRestDay}  گرم است. این کربوهیدرات از نوع میوه‌ها و سبزی‌ها با بیشترین تنوع رنگ ها می باشند مانند سیب، کاهوپیچ و هویج .'**
  String profileUserDescriptionCarbohydrate4(double carbohydrateValueInRestDay);

  /// No description provided for @profileUserDescriptionFat1.
  ///
  /// In fa, this message translates to:
  /// **'مقدار مصرف چربی مطابق با توصیه سازمان های بهداشت بزرگ جهانی و برنامه غذایی مدیترانیه و سبک آشپزی ایرانی 35 درصد انرژی روزانه است.'**
  String get profileUserDescriptionFat1;

  /// No description provided for @profileUserDescriptionFat2.
  ///
  /// In fa, this message translates to:
  /// **'کاهش چربی باعث کاهش وزن و کاهش شاخص توده بدنی و دور کمر و افزایش اعتماد بنفس میشود.'**
  String get profileUserDescriptionFat2;

  /// No description provided for @profileUserDescriptionFat3.
  ///
  /// In fa, this message translates to:
  /// **'بیشترین مقدار چربی سوزی  شما در 62 درصد تا 63 درصد مقدار VO2max شما اتفاق می‌افتد.'**
  String get profileUserDescriptionFat3;

  /// No description provided for @selectedFoodsDailyActivityLevel.
  ///
  /// In fa, this message translates to:
  /// **'{dayActivityLevel, select, rest{روز استراحت} moderate{روز تمرین} other{ترجمه تعریف نشده}}'**
  String selectedFoodsDailyActivityLevel(String dayActivityLevel);

  /// No description provided for @selectedFoodsListUserNutritionRequirement.
  ///
  /// In fa, this message translates to:
  /// **'در {dailyActivityLevel} انرژی مورد نیاز شما {calorie} کیلوکالری و {protein} گرم پروتئین و {rabohydrateVegetable} گرم کروبوهیدرات از نوع میوه و سبزی و {carbohydrateNonVegetable} گرم کربوهیدرات از نوع غنی و غلات و حبوبات و {fat} گرم چربی است.'**
  String selectedFoodsListUserNutritionRequirement(String dailyActivityLevel, int calorie, double protein, double rabohydrateVegetable, double carbohydrateNonVegetable, double fat);

  /// No description provided for @selectedFoodsListUserNutritionRestDayCarbohydrate1.
  ///
  /// In fa, this message translates to:
  /// **'همه کربوهیدرات ها از شکر ساده درست شده اند.'**
  String get selectedFoodsListUserNutritionRestDayCarbohydrate1;

  /// No description provided for @selectedFoodsListUserNutritionRestDayCarbohydrate2.
  ///
  /// In fa, this message translates to:
  /// **'شکر و قند نوعی کربوهیدرات هستند که از نیشکر و چغندر قند فراوری میشود و نوشیدن آن باعث پوسیدگی دندان میشود .برای مثال معمولا با چربی زیاد در شکلات و بیسکویت یا به با نمک زیاد به شکل چیپس فرآوری میشود.این غذاهای فراوری شده دارای انرژی زیاد و مواد مغذی و فیبر کمی است که باعث ایجاد گشنگی زودهنگام میشود.'**
  String get selectedFoodsListUserNutritionRestDayCarbohydrate2;

  /// No description provided for @selectedFoodsListUserNutritionRestDayCarbohydrate3.
  ///
  /// In fa, this message translates to:
  /// **'حداکثر 5 درصد انرژی روزانه شما یا {fivePercentCalorie} کیلوکالری میتواند از شکر باشد. این مقدار شکر برای شما معادل حدودا {sugarCubeCount} حبه قند می باشد که شامل شکر در غذا، شربت، آب میوه ، عسل می باشد و شامل شکر های موجود در شیر و سبزیجات و میوه ها نمیشود. '**
  String selectedFoodsListUserNutritionRestDayCarbohydrate3(int fivePercentCalorie, int sugarCubeCount);

  /// No description provided for @selectedFoodsListUserNutritionRestDayCarbohydrate4.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات موجود در میوه از نوع فروکتوز است که مصرف زیاد آن برای افراد غیرفعال باعث افزایش تری گلیسیرید و چربی خون میشود ولی اگر ورزش کنید تاثیری در چربی خون ندارد. اگر ورزش هم نمیکنید حداقل روزانه 2 تا 3 واحد میوه بخورید زیرا میوه شامل آب برای آبرسانی به بدن و فیبر برای افزایش سیستم ایمنی و فتوکمیکال برای جلوگیری از التهاب اکسیدان ها(مولکول های دارای یک اتم اکسیژن فعال) می باشد.'**
  String get selectedFoodsListUserNutritionRestDayCarbohydrate4;

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein1.
  ///
  /// In fa, this message translates to:
  /// **'سعی کنید هر 3 ساعت در 5 وعده و هر وعده به مقدار مساوی و منظم حدود {proteinPerMeal} گرم در هر وعده پروتئین بخورید*. پروتئین باعث سیری طولانی مدت تر نسبت به کربوهیدرات میشود و در کنار غلات سبوس دار و حبوبات فیبر دار باعث سیری و کاهش اشتها در روز میشود . 30 درصد از پروتئین را از منبع شیر و محصولات لبنی تامین کنید که همزمان غنی از کلسیم هستند. '**
  String selectedFoodsListUserNutritionRestDayProtein1(int proteinPerMeal);

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein2.
  ///
  /// In fa, this message translates to:
  /// **'تمام پروتئین های حیوانی مانند شیر و گوشت با کیفیت هستند. اگر 9 آمینو اسید ضروری در ماده غذایی تقریبا به اندازه نیاز بدن باشد به آنها پروتئین با کیفیت بالا میگیم، به همین خاطر بین مواد غذایی گیاهی ، سویا(شیر و ماست سویا) ، گندم سیاه، دانه کینوا، دانه چیا و دانه کنف یا شاهدانه غذای گیاهی شامل پروتئین با کیفیت بالا هستند.'**
  String get selectedFoodsListUserNutritionRestDayProtein2;

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein3.
  ///
  /// In fa, this message translates to:
  /// **'همچنین لوبیا، عدس، نخود، غلات و آجیل ها شامل برخی آمینو اسید های ضروری هستند که میتوانید با خوردن ترکیبی ازین مواد غذایی نیاز بدن به امینو اسید های ضروری را در 24 ساعت تامین کنید.برای مثال خوردن لوبیا و برنج و آجیل هر 9 آمینو اسید ضروری را تامین میکنند.'**
  String get selectedFoodsListUserNutritionRestDayProtein3;

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein4.
  ///
  /// In fa, this message translates to:
  /// **'پروتئین با مقدار جذب بیشتر از روده بزرگ و امتیاز بیشتر DIAAS : شیر و تخم مرغ و سویا و محصولات سویا و نخود  وعدس سبز و لوبیا سیاه و بادام زمینی و برنج سفید هستند. شما روزانه به {proteinPerBodyWeight} گرم پروتئین به ازای هر کیلو از وزن بدنتون نیاز دارید تا با توجه به سطح فعالیت هفتگی و سرعت کاهش وزن عضله‌های خود را حفظ و افزایش دهید.'**
  String selectedFoodsListUserNutritionRestDayProtein4(double proteinPerBodyWeight);

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein5.
  ///
  /// In fa, this message translates to:
  /// **'*مبتدیان مقدار پروتئین بیشتری نسبت به ورزشکار حرفه ای نیاز دارند ( تا 3 هفته اول 40 درصد بیشتر از افراد حرفه ای هست)'**
  String get selectedFoodsListUserNutritionRestDayProtein5;

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein6.
  ///
  /// In fa, this message translates to:
  /// **'اگر به اندازه کافی پروتئین بخورید میتوانید بدون ورزش و با حداقل کاهش ماهیچه ، چربی کم کنید.'**
  String get selectedFoodsListUserNutritionRestDayProtein6;

  /// No description provided for @selectedFoodsListUserNutritionRestDayProtein7.
  ///
  /// In fa, this message translates to:
  /// **'برای سرعت بیشتر و خوش اندام شدن و افزایش ماهیچه و پرورش اندام میتوانید ورزش کنید'**
  String get selectedFoodsListUserNutritionRestDayProtein7;

  /// No description provided for @selectedFoodsListUserNutritionRestDayFat1.
  ///
  /// In fa, this message translates to:
  /// **'چربی بیشترین مقدار انرژی را بین مواد غذایی دارد و به راحتی در خوردن آن زیاده روی میشود. برای مثال انرژی یک قاشق غذاخوری روغن، 9 کیلوکالری ضربدر 15 گرم یا 135 کیلو کالری در هر قاشق غذاخوری است پس به مقدار روغن دقت کنید.'**
  String get selectedFoodsListUserNutritionRestDayFat1;

  /// No description provided for @selectedFoodsListUserNutritionRestDayFat2.
  ///
  /// In fa, this message translates to:
  /// **'35 درصد انرژی روزانه از چربی ها تامین میشود و شامل 3 قسمت زیر است : '**
  String get selectedFoodsListUserNutritionRestDayFat2;

  /// No description provided for @selectedFoodsListUserNutritionRestDayFat3.
  ///
  /// In fa, this message translates to:
  /// **' 10 درصد چربی اشباع (معمولا جامد و نیمه جامد در دمای اتاق) : روغن گیاهی مانند پالم و نارگیل و کاکائو و روغن با منشا حیوانی مانند دمبه، چربی بین بافت ماهیچه و گوشت و کره و موارد مشابه.'**
  String get selectedFoodsListUserNutritionRestDayFat3;

  /// No description provided for @selectedFoodsListUserNutritionRestDayFat4.
  ///
  /// In fa, this message translates to:
  /// **'چربی های موجود در محصولات لبنی بخاطر شکل ساختاری مولکول های چربی شیر ، کلسترول خون را بالا نمی برد و بیماری فلبی عروقی ندارند و مقداری از چربی غیراشباع آن بخاطر ترکیب با کلسیم جذب بدن نمیشود.'**
  String get selectedFoodsListUserNutritionRestDayFat4;

  /// No description provided for @selectedFoodsListUserNutritionRestDayFat5.
  ///
  /// In fa, this message translates to:
  /// **'حداکثر 12 درصد چربی غیراشباع تک (معمولا مایع در دمای اتاق) : روغن زیتون ، روغن کلزا، روغن آفتابگردان و بادام زمینی، روغن فندق و بادام، آووکادو، زیتون، آجیل و دانه ها است.'**
  String get selectedFoodsListUserNutritionRestDayFat5;

  /// No description provided for @selectedFoodsListUserNutritionRestDayFat6.
  ///
  /// In fa, this message translates to:
  /// **'حداقل 13 درصد چربی غیراشباع چند (معمولا مایع در دمای اتاق) باشد : امگا 3 از نوع بلند EPAو DHA تنها به مقدار زیاد در ماهی چرب شامل قزل آلا و سالمون و خالی مخالی و به مقدار کمی در ماهی تن موجود است است . حداقل ماهی یک بارماهی چرب بخورید. روغن کلزا با نسبت 2 به 1 دارای امگا 6 و امگا 3 است و نقطه دود 170 درجه سانتی گراد دارد که مناسب پخت و پز می باشد.'**
  String get selectedFoodsListUserNutritionRestDayFat6;

  /// No description provided for @selectedFoodsListUserNutritionRestDayVitaminsAndMineral1.
  ///
  /// In fa, this message translates to:
  /// **'با مصرف میوه و سبزی با رنگ هاب مختلف در روز استراحت معمولا نیاز به ویتامین و مواد معدنی تامین میشود و برای تشخصی کمبود ویتامین و مواد معدنی به پزشک مراجعه کنید.'**
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral1;

  /// No description provided for @selectedFoodsListUserNutritionRestDayVitaminsAndMineral2.
  ///
  /// In fa, this message translates to:
  /// **'مصرف آهن برای انتقال اکسیژن در خون و مایچه مهم هست (هموگلوبین و میوگلوبین) . بعد از تمرین بخاطر اثر التهاب ، سطح هرمون تنظیم آهن یعنی هپسیدین به مدت 3 تا 6 ساعت بعد تمرین زیاد میشه و جذب آهن کاهش پیدا میکنه و آهن در این مدت شاید جذب نشود.'**
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral2;

  /// No description provided for @selectedFoodsListUserNutritionRestDayVitaminsAndMineral3.
  ///
  /// In fa, this message translates to:
  /// **'در صبح میزان هرمون هپسیدین در کمترین مقدار هست و آهن بهتر هست در صبح خورده بشه مثل املت اسفناج یا جگر که جذب را حداکثر میکند. جذب آهن با مصرف ویتامین سی مانند پرتقال افزایش پیدا میکنه.'**
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral3;

  /// No description provided for @selectedFoodsListUserNutritionRestDayVitaminsAndMineral4.
  ///
  /// In fa, this message translates to:
  /// **'غذاهای غنی از آهن عبارتند از گوشت و کله پاچه، ساردین، ماهی تن، غلات سبوس دار، زرده تخم مرغ، لوبیا، عدس، سبزیجات برگ سبز، زردآلو خشک، آجیل و دانه ها. '**
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral4;

  /// No description provided for @selectedFoodsListUserNutritionRestDayVitaminsAndMineral5.
  ///
  /// In fa, this message translates to:
  /// **'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.'**
  String get selectedFoodsListUserNutritionRestDayVitaminsAndMineral5;

  /// No description provided for @selectedFoodsListUserNutritionRestDayHydration1.
  ///
  /// In fa, this message translates to:
  /// **'خوردن آب قبل وعده غذایی باعث میشه زودتر سیر بشید و احساس رضایت داشته باشید ولی روی بعد از غذا تاثیری نداره و امکان داره بخاطر دریافت نکردن کالری کمتر برای وعده بعدی زودتر گرسنه شوید.'**
  String get selectedFoodsListUserNutritionRestDayHydration1;

  /// No description provided for @selectedFoodsListUserNutritionRestDayHydration2.
  ///
  /// In fa, this message translates to:
  /// **'در بین غذاهای سفت مثل غذای برنجی و نانی خوردن آب باعث کمک به هضم غذا میشه و در بین غذاهای آبکی نیاز نیست . خوردن خیلی زیاد آب باعث میشه شیره معده رقیق بشه پس همراه غذای خیلی آبکی آب ننوشید. بخاطر ماهیچه بودن معده و امکان انقباض و انبساط آن خوردن آب با برنج یا نان و دیگر مواد غذایی باعث بزرگ شدن معده نمیشود و معده بعد از تخلیه به اندازه قبلی بازمیگردد.'**
  String get selectedFoodsListUserNutritionRestDayHydration2;

  /// No description provided for @selectedFoodsListUserNutritionRestDayHydration3.
  ///
  /// In fa, this message translates to:
  /// **'آهن و زینک و کلسیم دارای سیستم جذب و انتقال یکسان هستند پس مصرف زیاد آهن باعث کاهش جذب زینک و کلسیم میشه پس اگر صبح مواد غذایی شامل آهن میخورید سعی کنید مواد غذایی شامل کلسیم مثل شیر یا شامل زینک مثل گوشت قرمز یا غلات کامل را با آن نخورید.'**
  String get selectedFoodsListUserNutritionRestDayHydration3;

  /// No description provided for @selectedFoodsListUserNutritionRestDayHydration4.
  ///
  /// In fa, this message translates to:
  /// **'اگر در منطقه معتدل آب و هوایی زندگی میکنید خوردن حداقل {waterVolume} لیتر آب برای شما نیاز است مهم نیست آب از دمنوش و چای و قهوه یا آب میوه یا نوشیدنی انرژی باشد. هرچه محیط گرم تر باشد آب بیشتری نیاز دارید و برعکس.'**
  String selectedFoodsListUserNutritionRestDayHydration4(double waterVolume);

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein1.
  ///
  /// In fa, this message translates to:
  /// **'غذای پروتئینی و تمرین مقاوتی مایچه میسازد و ماهیچه بیشتر باعث افزایش نرخ سوخت و ساز و سرعت بیشتر کاهش وزن همزمان با افزایش اعتماد بنفس و پرورش اندام میشود. '**
  String get selectedFoodsListUserNutritionExerciseDayProtein1;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein2.
  ///
  /// In fa, this message translates to:
  /// **'برای مایچه سازی پروتئین با کیفیت شامل لوسین که سریع هضم و جذب میشود لازم است . برای حداکثر مایچه سازی باید باید محدوده آستانه لوسین رد بشه که شامل 2 تا 3 گرم لوسین در هر وعده میشود.'**
  String get selectedFoodsListUserNutritionExerciseDayProtein2;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3.
  ///
  /// In fa, this message translates to:
  /// **'مواد غذایی زیر دارای 2 تا 3 گرم لوسین است که بعد از تمرین به همراه کربوهیدرات برای حداکثر ماهیچه سازی بهتر است استفاده کنید'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine1.
  ///
  /// In fa, this message translates to:
  /// **'600 میلی لیتر شیر کامل'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine1;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine2.
  ///
  /// In fa, this message translates to:
  /// **'85 گرم پنیر چدار'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine2;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine3.
  ///
  /// In fa, this message translates to:
  /// **'450 گرم ماست ساده'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine3;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine4.
  ///
  /// In fa, this message translates to:
  /// **'4 تا تخم مرغ (یک زرده و 4 سفیده توصیه میشه )'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine4;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine5.
  ///
  /// In fa, this message translates to:
  /// **'85 گرم گوشت قرمز یا گوشت پرنده'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine5;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine6.
  ///
  /// In fa, this message translates to:
  /// **'100 گرم ماهی'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine6;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine7.
  ///
  /// In fa, this message translates to:
  /// **'17 گرم پودر پروتئین وی'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine7;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine8.
  ///
  /// In fa, this message translates to:
  /// **'400 گرم لوبیا یا عدس پخته شده'**
  String get selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine8;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein4.
  ///
  /// In fa, this message translates to:
  /// **'شیر شامل آب و پروتئین و کربوهیدرات و مواد مغذی است که آن را برای بهبود ماهیچه بعد از تمرین گزینه عالی میکند زیرا باعث تامین ذخیره گلیکوژن و ترکیب پروتئین برای ساخت ماهیچه و آب رسانی به بدن میشود. تفاوتی ندارد به شکل شیر کم چرب یا پرچرب باشد یا به شکل شیر قهوه یا شیر کاکائو یا با مزه های متفاوت میل کنید.'**
  String get selectedFoodsListUserNutritionExerciseDayProtein4;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayProtein5.
  ///
  /// In fa, this message translates to:
  /// **'برای ریکاوری و مایچه سازی آخر شب مواد حاوی Casein یا کازین مثل شیر یا ماست یا مکمل میل کنید. پرتئین به شما احساس پر بودن و سیری طولانی مدت و خواب عمیق تر میدهد.'**
  String get selectedFoodsListUserNutritionExerciseDayProtein5;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate1.
  ///
  /// In fa, this message translates to:
  /// **'زمان و مقدار مصرف کربوهیدرات قبل از تمرین باهم در ارتباط است به صورت کلی 1 تا 4 گرم کربوهیدرات به ازای هر کیلو وزن بدن از 1 تا 4 ساعت مانده به تمرین میتونید مصرف کنید. برای مثال با وزن {weight} کیلویی شما اگر 2 ساعت به شروع تمرین باقی مانده میتوانید {carbohydrate} گرم کربوهیدرات به همراه {protein} گرم پروتئین با کیفیت بخورید.'**
  String selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate1(int weight, int carbohydrate, int protein);

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate2.
  ///
  /// In fa, this message translates to:
  /// **'مصرف کربوهیدرات 1 تا 4 ساعت قبل از تمرین باعث افزایش ذخیره گلیکوژن و افزایش کارایی تمرین میشود. خوردن کربوهیدرات تا 2 ساعت قبل تمرین زمان کافی برای هضم و جذب آن را میدهد. '**
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate2;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate3.
  ///
  /// In fa, this message translates to:
  /// **'اگر نزدیک به زمان تمرین غذا بخورید امکان دارد غذا خوردن باعث سوهاضمه و ناراحتی معده شود زیرا در زمان تمرین تمرکز جریان خون از معده به سمت عظله های هدف می رود تا اکسیژن را از طریق جریان خون به عظله ها برساند.'**
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate3;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate4.
  ///
  /// In fa, this message translates to:
  /// **'مصرف کربوهیدرات 1 تا 4 ساعت قبل از تمرین باعث افزایش ذخیره گلیکوژن و افزایش کارایی تمرین میشود. خوردن کربوهیدرات تا 2 ساعت قبل تمرین زمان کافی برای هضم و جذب آن را میدهد. '**
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate4;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate5.
  ///
  /// In fa, this message translates to:
  /// **'اگر ناراحتی معده و سوهاضمه احساس کردید سعی کنید 2 ساعت قبل شروع تمرین یک میان وعده سبک و ساده با کربوهیدرات با جی آی بالا مثل موز یا هر میوه تازه یا میوه خشک شده و یک مشت آجیل بخورید یا نان و کره مغزیجات مثل کره پسته یا بادام زمینی بخورید یا فرنی یا جودوسر و شیر(انواع اوتمیل) بخورید.'**
  String get selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate5;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate1.
  ///
  /// In fa, this message translates to:
  /// **'تا قبل از 45 دقیقه تمرین بجز اب چیزی نیاز نیست بخورید زیرا در طول این زمان خالی شدن ذخیره گلیکوژن محتمل نیست . '**
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate1;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate2.
  ///
  /// In fa, this message translates to:
  /// **'برای تمرین های بین 45 تا 75 دقیقه میتونید کربوهیدرات شیرین بمکید و بچشید تا همزمان پیام خستگی به مغز را مسدود کنید و از مشکلات گوارشی اگر برای شما خوردن هنگام تمرین سخت است جلوگیری کنید. '**
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate2;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate3.
  ///
  /// In fa, this message translates to:
  /// **'برای تمرین های بیشتر از 1 ساعت به ازای هر ساعت میتوانید 30 تا 60 گرم کربوهیدرات با توجه به شدت تمرین مصرف کنید. زیرا بدن نمیتواند بیشتر از 1 گرم گلوکوز در هر دقیقه در مایچه با اکسیژن ترکیب کند، مصرف بیشتر از 60 گرم کربوهیدرات باعث مشکلات گوارشی میشود و منفعتی نیز ندارد. '**
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate3;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate4.
  ///
  /// In fa, this message translates to:
  /// **'حدود 15 تا 20 دقیقه طول میگشد تا کربوهیدرات خورده شده به مایچه برسد، بنابراین قبل از شروع خستگی میان وعده تمرین را بخورید. معمولا هر 20 تا 30 دقیقه بین تمرین میتونید کربوهیدرات بخورید .'**
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate4;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate5.
  ///
  /// In fa, this message translates to:
  /// **'3 نمونه از میان وعده های تمرین شامل یک عدد موز، دو عدد خرما یا یک عدد انبه میشود، هر کدام 30 گرم کربوهیدرات دارد و اگر شدت تمرین بیشتر از تا دوبرابر این مقدار میتواند بخورید.'**
  String get selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate5;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate1.
  ///
  /// In fa, this message translates to:
  /// **'گلیکوژن تخلیه شده در زمان تمرین باید برای تمرین روزهای بعدی تامین شود وگرنه روز تمرین بعدی باعث کاهش کارایی تمرین شما میشود. '**
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate1;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate2.
  ///
  /// In fa, this message translates to:
  /// **'در 2 ساعت بعد از تمرین تا 150 درصد بیشتر از جالت عادی گلیکوژن ذخیره میشود.'**
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate2;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate4.
  ///
  /// In fa, this message translates to:
  /// **'اینکه در 2 ساعت اول مقدار بیشتری گلوکوز جذب میشود دو دلیل دارد اول اینکه با خوردن کربوهیدرات مقدار گلوکوز بیشتری در خون برای تامین تولید گلیکوژن در ماهیچه ها است و دوم اینکه غشای سلولی نفوذپذیری بیشتری برای دریافت گلوکوز نسبت به حالت عادی دارد.'**
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate4;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate5.
  ///
  /// In fa, this message translates to:
  /// **'تا 4 ساعت بعد از تمرین به ازای هر کیلو وزن بدن میتونید 1 تا 1.2 گرم کربوهیدرات در هرساعت بخورید که معادل {carbohydrateValu1} تا { carbohydrateValu2} گرم کربوهیدرات در هر ساعت میشود. این حداکثر مقدار کربوهیدرات است که در هر ساعت سیستم گوارش میتواند هضم کند.'**
  String selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate5(int carbohydrateValu1, int carbohydrateValu2);

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate6.
  ///
  /// In fa, this message translates to:
  /// **'کربوهیدرات را حتما با پروتئین با کیفیت شامل لوسین برای حداکثررساندن ماهیچه سازی و تامین گلیکوژن میل کنید.'**
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate6;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate7.
  ///
  /// In fa, this message translates to:
  /// **'خوردن پروتئین به همراه کربوهیدرات باعث ترشح بیشتر انسولین نسبت به زمانی که فقط کربوهیدرات میخورید میشود. افزایش انسولین باعث افزایش مقدار و افزایش سرعت جذب گلوکوز و آمینواسید پروتئین توسط سلول ماهیچه ها میشود. مقدار بیشتر انسولین باعث کاهش سطح کورتیزل میشود و در نتیجه ترکیب پروتئین برای ساخت ماهیچه افزایش میابد.'**
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate7;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate8.
  ///
  /// In fa, this message translates to:
  /// **'همچنین وجود پروتئین در وعده غذایی باعث ساخت پروتئین و کاهش شکستن پروتئین و موجود بودن پروتئین بیشتر در ماهیچه ها برای ترمیم بعد از تمرین میشود که منجر به ماهیچه سازی بیشتر میشود.'**
  String get selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate8;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration1.
  ///
  /// In fa, this message translates to:
  /// **'معمولا در تمرین بین 0.5 تا 2.5 لیتر آب به عرق تبدیل میشود. وقتی مقدار آب بدن کم باشد وهایپوهیدرشن اتفاق بیافتد حجم خون کم میشه و غلظت خون بالا میرود و قلب باید سخت تر کار کند تا فشار خون افزایش پیدا کند و در نتیجه فشار اضافی به قلب و شش و سیستم خون رسانی وارد میشود.'**
  String get selectedFoodsListUserNutritionExerciseDayHydration1;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration2.
  ///
  /// In fa, this message translates to:
  /// **'کم ابی یا هایپوهیدراشن به روزهای قبل و تمرین های قبلی بستگی داره و کم آبی امروز روی تمرین فردا تاثیر میگذارد.'**
  String get selectedFoodsListUserNutritionExerciseDayHydration2;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration3.
  ///
  /// In fa, this message translates to:
  /// **'بهترین راه نوشیدن مقدار مناسب آب در روز، نگاه کردن به رنگ اوره ادرار و مقایسه آن با جدول رنگ اوره است.'**
  String get selectedFoodsListUserNutritionExerciseDayHydration3;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration4.
  ///
  /// In fa, this message translates to:
  /// **'به صورت چشمی باید ادرار رقیق و رنگ پریده باشه و رنگ تیره و حجم کم یعنی آب بدن کم هست و باید قبل تمرین بیشتر بنوشید. '**
  String get selectedFoodsListUserNutritionExerciseDayHydration4;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration5.
  ///
  /// In fa, this message translates to:
  /// **'با وزن شما خوردن {fiveTimeWeight} تا { tenTimeWeight } میلی لیتر آب 2 تا 4 ساعت قبل تمرین مناسب است، واگر باعث نشد ادرار کنید یا رنگ ادرار تیره بود باید بیشتر آب بنوشید.'**
  String selectedFoodsListUserNutritionExerciseDayHydration5(int fiveTimeWeight, int tenTimeWeight);

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration6.
  ///
  /// In fa, this message translates to:
  /// **'آب را بعد از تمرین را در چند وعده میل کنید تا حجم خون یکباره زیاد نشود زیرا باعث ادرار و کم آب ماندن بدن میشود.'**
  String get selectedFoodsListUserNutritionExerciseDayHydration6;

  /// No description provided for @selectedFoodsListUserNutritionExerciseDayHydration7.
  ///
  /// In fa, this message translates to:
  /// **'آب را بعد از تمرین اگر زیاد عرق کردید با نمک یا طعم دهنده بخورید . مشکل مصرف آب خالی این هست که باعث کاهش غلظت خون میشود و از طرفی احساس تشنگی رو کم میکند ولی از طرفی باعث ادرار میشود و در نتیجه باعث میشه قبل اینکه سیراب بشید از نوشیدن آب دست بکشید.'**
  String get selectedFoodsListUserNutritionExerciseDayHydration7;
}

class _ComponentLibraryLocalizationsDelegate extends LocalizationsDelegate<ComponentLibraryLocalizations> {
  const _ComponentLibraryLocalizationsDelegate();

  @override
  Future<ComponentLibraryLocalizations> load(Locale locale) {
    return SynchronousFuture<ComponentLibraryLocalizations>(lookupComponentLibraryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_ComponentLibraryLocalizationsDelegate old) => false;
}

ComponentLibraryLocalizations lookupComponentLibraryLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fa': return ComponentLibraryLocalizationsFa();
  }

  throw FlutterError(
    'ComponentLibraryLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
