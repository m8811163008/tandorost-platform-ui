// import 'package:domain_model/domain_model.dart';

// extension SelectedFoodToCM on SelectedFood {
//   SelectedFoodCM toCacheModel() => SelectedFoodCM()
//     ..name = name
//     ..calorie = calorie
//     ..gramsPerUnit = gramsPerUnit
//     ..macroNutrition = macroNutrition.toCacheModel()
//     ..selectedDate = selectedDate
//     ..unitOfMeasurmentCM = unitOfMeasurement.toCacheModel()
//     ..numberOfUnits = measurementUnitCount;
// }

// extension MacroNutritionToCM on MacroNutrition {
//   MacroNutritionCM toCacheModel() => MacroNutritionCM()
//     ..isVegetable = isVegetable
//     ..fat = fat
//     ..carbohydrate = carbohydrate
//     ..protein = protein;
// }

import 'package:domain_model/domain_model.dart';

extension UnitOfMeasurementCM on UnitOfMeasurement {
  UnitOfMeasurmentCM toCacheModel() => UnitOfMeasurmentCM(
        title: title.name,
        icon: icon.toCacheModel(),
        max: max,
        howManyGrams: howManyGrams,
      );
}

extension IoniconsDataCM on IoniconsData {
  String toCacheModel() => switch (this) {
        Ionicons.ellipse_outline => 'ellipse_outline',
        _ => throw Exception('Not definded unit of measurement')
      };
}

// extension FoodToCm on Food {
//   FoodCM toCacheModel() {
//     return FoodCM()
//       ..calorie = calorie
//       ..gramsPerUnit = gramsPerUnit
//       ..macroNutrition = macroNutrition.toCacheModel()
//       ..name = name;
//   }
// }
