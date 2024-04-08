import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;

  String? name;

  // Calaries per 1 grams of this food.
  int? calorie;

  /// gram per one unit of food for example each apple is 100 grams
  int? gramsPerUnit;

  /// The actual value of macro nutrition of the food per 1 gram.
  ///
  /// For example 1 grams of apple has 0.003g protein and 0.004g fat and 0.005g carbohydrate.
  MacroNutritionCM macroNutrition = MacroNutritionCM();

  /// Whether this food is vegetable or fruit or not.
  bool? isVegetable;

  FoodCM update(
    FoodCM foodCM,
  ) {
    return FoodCM()
      ..name = foodCM.name ?? this.name
      ..calorie = foodCM.calorie ?? this.calorie
      ..gramsPerUnit = foodCM.gramsPerUnit ?? this.gramsPerUnit
      ..macroNutrition = this.macroNutrition.update(foodCM.macroNutrition)
      ..isVegetable = foodCM.isVegetable ?? this.isVegetable;
  }
}

/// The actual value of macro nutrition of the food per 1 gram.
///
/// For example 1 grams of apple has 0.003g protein and 0.004g fat and 0.005g carbohydrate.

@embedded
class MacroNutritionCM {
  double? carbohydrate;
  double? fat;
  double? protein;

  double get totalWeight {
    final sum = carbohydrate! + fat! + carbohydrate!;
    if (sum > 1.0) throw Exception('sum is more than 1 gram');
    return sum;
  }

  MacroNutritionCM update(
    MacroNutritionCM macroNutritionCM,
  ) {
    return MacroNutritionCM()
      ..carbohydrate = macroNutritionCM.carbohydrate ?? this.carbohydrate
      ..fat = macroNutritionCM.fat ?? this.fat
      ..protein = macroNutritionCM.protein ?? this.protein;
  }
}
