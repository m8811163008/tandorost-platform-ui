import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;
  late String name;

  /// Calaries per 100 grams of this food.
  late int calorie;

  /// gram per one unit of food for example each apple is 100 grams
  late int gramsPerUnit;

  /// The actual value of macro nutrition of the food per 100 grams.
  ///
  /// For example 100 grams of apple has 0.3g protein and 0.4g fat and 0.5g carbohydrate.
  late MacroNutritionCM macroNutrition;

  FoodCM copyWith({
    Id? id,
    String? name,
    int? calorie,
    int? gramsPerUnit,
    MacroNutritionCM? macroNutrition,
  }) {
    return FoodCM()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..calorie = calorie ?? this.calorie
      ..gramsPerUnit = gramsPerUnit ?? this.gramsPerUnit
      ..macroNutrition = macroNutrition ?? this.macroNutrition;
  }
}

/// The actual value of macro nutrition of the food per 100 grams.
///
/// For example 100 grams of apple has 0.3g protein and 0.4g fat and 0.5g carbohydrate.
@embedded
class MacroNutritionCM {
  late double carbohydrate;
  late double fat;
  late double protein;

  /// Whether this food is vegetable or fruit or not.
  late bool isVegetable;

  MacroNutritionCM copyWith({
    double? carbohydrate,
    double? fat,
    double? protein,
    bool? isVegetable,
  }) {
    return MacroNutritionCM()
      ..carbohydrate = carbohydrate ?? this.carbohydrate
      ..fat = fat ?? this.fat
      ..protein = protein ?? this.protein
      ..isVegetable = isVegetable ?? this.isVegetable;
  }
}
