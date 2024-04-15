// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain_model/domain_model.dart';

class DietInfo {
  final double waistCircumference;
  final double height;
  final double weight;
  final double age;
  final bool isMale;
  final ChangeWeightSpeed changeWeightSpeed;

  /// The activity level of user per week.
  final ActivityLevelCM activityLevelCM;

  const DietInfo({
    required this.waistCircumference,
    required this.height,
    required this.weight,
    required this.age,
    required this.isMale,
    required this.changeWeightSpeed,
    required this.activityLevelCM,
  });

  const DietInfo.empty()
      : waistCircumference = -1.0,
        activityLevelCM = ActivityLevelCM.fairyActive,
        height = -1,
        weight = -1,
        age = -1.0,
        isMale = false,
        changeWeightSpeed = ChangeWeightSpeed.none;

  /// Energy used for breathing and diegstion and maintain the body temperture.
  ///
  /// It cacultaed base on age and weight and height and gender base on Mufflin st geor formulla.
  double get restingMetabolicRate =>
      10 * weight + 6.25 * height - 5 * age + (isMale ? 5 : -161);

  /// Total energy is required base on activity level and restingMetabolicRate
  double get totalDailyEnergyExpenditure =>
      restingMetabolicRate * activityLevelCM.multiplier;
  // to predict diabtes type 2 and blood presure and cardio(heart and arthritis) disease and bale grader disease
  double get waistCircumferenceToHeightRatio => waistCircumference / height;

  /// Is ratio of waistCircumference to height is less than 0.5
  bool get isWaistCircumferenceToHeightRatioSafe =>
      waistCircumferenceToHeightRatio < 0.5;

  /// Is waistCircumference is less than 94 in men and less than 80 in women.
  bool get isWaistCircumferenceSafeRange {
    return isMale ? waistCircumference < 94 : waistCircumference < 80;
  }

  /// BMI is weight in kilograms divided by height in meters squared
  double get bmi => weight / ((height / 100) * (height / 100));

  /// Health Risk factors assosiate with current bmi value.
  BmiLevels get bmiLevel {
    return BmiLevels.values
        .singleWhere((element) => bmi >= element.min && bmi < element.max);
  }

  MacroNutritionRequirements macroNutritionRequirements(
      DayActivityLevel dayActivityLevel) {
    return MacroNutritionRequirements(
        weight: weight,
        totalDailyEnergyExpenditure: totalDailyEnergyExpenditure,
        dayActivityLevel: dayActivityLevel,
        changeWeightSpeed: changeWeightSpeed);
  }

  DietInfo copyWith({
    double? waistCircumference,
    double? height,
    double? weight,
    double? age,
    bool? isMale,
    ChangeWeightSpeed? changeWeightSpeed,
    ActivityLevelCM? activityLevelCM,
  }) {
    return DietInfo(
      waistCircumference: waistCircumference ?? this.waistCircumference,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      changeWeightSpeed: changeWeightSpeed ?? this.changeWeightSpeed,
      activityLevelCM: activityLevelCM ?? this.activityLevelCM,
    );
  }
}

enum BmiLevels {
  underweight(max: 18.4),
  healthyWeight(min: 18.5, max: 24.9),
  overweight(min: 25.0, max: 29.9),
  obesity(min: 30);

  const BmiLevels({this.min = 0, this.max = double.infinity});
  final double min;
  final double max;
}

enum DayActivityLevel {
  rest,
  moderate;

  bool get isRest => this == rest;
  bool get isModerate => this == moderate;
}

class MacroNutritionRequirements {
  final double weight;
  final double totalDailyEnergyExpenditure;
  final DayActivityLevel dayActivityLevel;
  final ChangeWeightSpeed changeWeightSpeed;

  MacroNutritionRequirements(
      {required this.weight,
      required this.totalDailyEnergyExpenditure,
      required this.dayActivityLevel,
      required this.changeWeightSpeed});

  double get _proteinPerKilogram => switch (changeWeightSpeed) {
        ChangeWeightSpeed.none => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 0.0,
            DayActivityLevel.rest => 0.0,
          },
        ChangeWeightSpeed.slowAndEasy => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 0.0,
            DayActivityLevel.rest => 0.0,
          },
        ChangeWeightSpeed.slowAndEasy => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 0.0,
            DayActivityLevel.rest => 0.0,
          },
        ChangeWeightSpeed.medium => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 0.0,
            DayActivityLevel.rest => 0.0,
          },
        ChangeWeightSpeed.fastAndHard => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 0.0,
            DayActivityLevel.rest => 0.0,
          }
      };

  double get protein => _proteinPerKilogram * weight;

  /// 35% of totalDailyEnergyExpenditure should be helthy fats.
  ///
  /// 10% saturated and 12% mono unsaturated and 13% polysaturated.
  double get fat => 0.35 * totalDailyEnergyExpenditure / 9;

  double get _carbohydrateCalorie {
    // totalDailyEnergyExpenditure - fatCalorie - proteinCalorie
    return totalDailyEnergyExpenditure -
        (0.35 * totalDailyEnergyExpenditure) -
        (protein * 4);
  }

  double get carbohydrate => _carbohydrateCalorie / 4;

  double get carbohydrateFruitVegetable {
    return switch (dayActivityLevel) {
      DayActivityLevel.moderate => 0.25 * carbohydrate,
      DayActivityLevel.rest => 0.4 * carbohydrate
    };
  }

  double get carbohydrateNonFruitVegetable =>
      carbohydrate - carbohydrateFruitVegetable;
}
