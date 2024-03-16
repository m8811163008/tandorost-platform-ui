import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';

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
  int? carbohydrate;
  int? fat;
  int? protein;
}
