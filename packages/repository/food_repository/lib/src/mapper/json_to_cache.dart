import 'package:local_storage/local_storage.dart';

extension MapToCM on Map<String, dynamic> {
  FoodCM foodCMfromJson() {
    final food = FoodCM(
        name: this['name'] as String,
        calorie: (this['calorie'] as int) / 100,
        gramsPerUnit: this['gramsPerUnit'] as int,
        macroNutrition: macroNutritionFromJson(),
        isVegetable: this['macroNutrition']['isVegetable'] as bool);

    return food;
  }

  MacroNutritionCM macroNutritionFromJson() {
    return MacroNutritionCM(
      carbohydrate: (this['macroNutrition']['carbohydrate'] as double) / 100,
      fat: (this['macroNutrition']['fat'] as double) / 100,
      protein: (this['macroNutrition']['protein'] as double) / 100,
    );
  }

  UnitOfMeasurmentCM unitOfMeasurmentCMFromJson() {
    final unitOfMeasurment = UnitOfMeasurmentCM(
      title: this['title'] as String,
      icon: this['icon'] as String,
      max: this['max'] as int?,
      howManyGrams: this['howManyGrams'] as int?,
    );

    return unitOfMeasurment;
  }
}
