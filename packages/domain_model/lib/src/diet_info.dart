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
      activityLevelCM: activityLevelCM,
      changeWeightSpeed: changeWeightSpeed,
    );
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
  underweight(max: 18.5),
  healthyWeight(min: 18.5, max: 25.0),
  overweight(min: 25.0, max: 30),
  obesClass1(min: 30, max: 35.0),
  obesClass2(min: 35.0, max: 40.0),
  obesClass3(min: 40.0);
  // todo change to BMI prime

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
  final ActivityLevelCM activityLevelCM;
  final ChangeWeightSpeed changeWeightSpeed;

  MacroNutritionRequirements({
    required this.weight,
    required this.totalDailyEnergyExpenditure,
    required this.dayActivityLevel,
    required this.activityLevelCM,
    required this.changeWeightSpeed,
  });

  double get _proteinPerKilogram => switch (activityLevelCM) {
        ActivityLevelCM.sedentary => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 0.8,
            DayActivityLevel.rest => 1.8,
          },
        ActivityLevelCM.fairyActive => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 1.2,
            DayActivityLevel.rest => 2.0,
          },
        ActivityLevelCM.moderatelyActive => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 1.5,
            DayActivityLevel.rest => 2.3,
          },
        ActivityLevelCM.active => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 2.0,
            DayActivityLevel.rest => 2.7,
          },
        ActivityLevelCM.veryActive => switch (dayActivityLevel) {
            DayActivityLevel.moderate => 2.2,
            DayActivityLevel.rest => 2.7,
          }
      };

  /// Daily requirement protein of this person.
  double get protein => _proteinPerKilogram * weight;

  // How much energy should we substract based on [dayActivityLevel] and [changeWeightSpeed].
  double _dayActivityMultiplier(DayActivityLevel dayActivityLevel) {
    return switch (dayActivityLevel) {
      DayActivityLevel.moderate => changeWeightSpeed.trainingDayChangeValue,
      DayActivityLevel.rest => changeWeightSpeed.restDayChangeValue,
    };
  }

  /// Daily requirement of total energy expenditure based on [dayActivityLevel] and [changeWeightSpeed].
  int get effectiveTotalDailyEnergyExpenditure => (totalDailyEnergyExpenditure *
          (1 - _dayActivityMultiplier(dayActivityLevel)))
      .toInt();

  /// 35% of totalDailyEnergyExpenditure should be helthy fats.
  ///
  /// 10% saturated and 12% mono unsaturated and 13% polysaturated.
  double get fat => 0.35 * effectiveTotalDailyEnergyExpenditure / 9;

  double get _carbohydrateCalorie {
    // totalDailyEnergyExpenditure - fatCalorie - proteinCalorie
    return effectiveTotalDailyEnergyExpenditure -
        (0.35 * effectiveTotalDailyEnergyExpenditure) -
        (protein * 4);
  }

  // carbohydrate in grams
  double get carbohydrate => _carbohydrateCalorie / 4;

  double get carbohydrateFruitVegetable {
    return switch (dayActivityLevel) {
      // 33% of carb is vegetable
      DayActivityLevel.moderate => 0.33 * carbohydrate,
      // 66% of carb is vegetable
      DayActivityLevel.rest => 0.66 * carbohydrate
    };
  }

  double get carbohydrateNonFruitVegetable =>
      carbohydrate - carbohydrateFruitVegetable;
}
