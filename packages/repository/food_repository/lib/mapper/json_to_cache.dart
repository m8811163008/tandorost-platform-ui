import 'package:local_storage/local_storage.dart';

extension MapToCM on Map<String, dynamic> {
  FoodCM foodCMfromJson() {
    final food = FoodCM();
    food.name = this['name'] as String;
    food.calorie = this['calorie'] as int;
    food.gramsPerUnit = this['gramsPerUnit'] as int;
    food.macroNutrition = macroNutritionFromJson();
    return food;
  }

  MacroNutritionCM macroNutritionFromJson() {
    final macroNutrition = MacroNutritionCM();
    macroNutrition.carbohydrate =
        this['macroNutrition']['carbohydrate'] as double;
    macroNutrition.fat = this['macroNutrition']['fat'] as double;
    macroNutrition.protein = this['macroNutrition']['protein'] as double;
    macroNutrition.isVegetable = this['macroNutrition']['isVegetable'] as bool;

    return macroNutrition;
  }

  UnitOfMeasurmentCM unitOfMeasurmentCMFromJson() {
    final unitOfMeasurment = UnitOfMeasurmentCM();
    unitOfMeasurment.title = this['title'] as String;
    unitOfMeasurment.icon = this['icon'] as String;
    unitOfMeasurment.howManyGrams = this['howManyGrams'] as int?;
    unitOfMeasurment.max = this['max'] as int?;
    return unitOfMeasurment;
  }
}
