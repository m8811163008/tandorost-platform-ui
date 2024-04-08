// import 'package:domain_model/domain_model.dart';

// extension FoodCMToDomain on FoodCM {
//   Food toDomain() {
//     return Food(
//       name: name,
//       calorie: calorie,
//       gramsPerUnit: gramsPerUnit,
//       macroNutrition: MacroNutrition(
//         carbohydrate: macroNutrition.carbohydrate,
//         fat: macroNutrition.fat,
//         protein: macroNutrition.protein,
//         isVegetable: macroNutrition.isVegetable,
//       ),
//     );
//   }
// }

import 'package:domain_model/domain_model.dart';

extension UnitOfMeasurementCMToDomain on UnitOfMeasurmentCM {
  UnitOfMeasurement toDomain() {
    return UnitOfMeasurement(
      howManyGrams: howManyGrams,
      icon: icon!.toIcon(),
      max: max,
      title: UnitOfMeasurementType.values.singleWhere(
        (element) => element.name == title,
      ),
    );
  }
}

extension StringTOIcon on String {
  IoniconsData toIcon() => switch (this) {
        'ellipse_outline' => Ionicons.ellipse_outline,
        _ => throw Exception('Not definded unit of measurement')
      };
}

// extension SelectedFoodCMToDomain on SelectedFoodCM {
//   SelectedFood toDomain() {
//     return SelectedFood(
//       name: name,
//       selectedDate: selectedDate,
//       measurementUnitCount: numberOfUnits,
//       calorie: calorie,
//       gramsPerUnit: gramsPerUnit,
//       macroNutrition: MacroNutrition(
//         carbohydrate: macroNutrition.carbohydrate,
//         fat: macroNutrition.fat,
//         protein: macroNutrition.protein,
//         isVegetable: macroNutrition.isVegetable,
//       ),
//       unitOfMeasurement: unitOfMeasurmentCM.toDomain(),
//     );
//   }
// }
