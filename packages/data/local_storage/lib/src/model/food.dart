import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;
  late String name;
  int? calorie;
  int? gramsPerUnit;
  MacroNutritionCM? macroNutrition;

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

@embedded
class MacroNutritionCM {
  double? carbohydrate;
  double? fat;
  double? protein;
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
