import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;
  late String name;
  int? calorie;
  int? gramsPerUnit;
  MacroNutritionCM? macroNutrition;
}

@embedded
class MacroNutritionCM {
  double? carbohydrate;
  double? fat;
  double? protein;
}
