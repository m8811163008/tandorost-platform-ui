import 'package:local_storage/local_storage.dart';

extension MapToCM on Map<String, dynamic> {
  FoodCM foodCMfromJson(Map<String, dynamic> json) {
    final food = FoodCM();
    food.name = json['name'] as String;
    food.calorie = json['calorie'] as int?;
    food.gramsPerUnit = json['gramsPerUnit'] as int?;
    food.macroNutrition = macroNutritionFromJson(json['macroNutrition']);
    return food;
  }

  MacroNutritionCM macroNutritionFromJson(Map<String, dynamic> json) {
    final macroNutrition = MacroNutritionCM();
    macroNutrition.carbohydrate = json['carbohydrate'] as int?;
    macroNutrition.fat = json['fat'] as int?;
    macroNutrition.protein = json['protein'] as int?;

    return macroNutrition;
  }

  UnitOfMeasurmentCM unitOfMeasurmentCMFromJson(Map<String, dynamic> json) {
    final unitOfMeasurment = UnitOfMeasurmentCM();
    unitOfMeasurment.title = json['title'] as String;
    unitOfMeasurment.icon = json['icon'] as String;
    unitOfMeasurment.howManyGrams = json['howManyGrams'] as double;
    return unitOfMeasurment;
  }
}
