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
      icon: icon.toIcon(),
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

// extension FoodCMToDomain on FoodCM {
//   Food toDomain() {
//     return Food(
//       name: name!,
//       calorie: calorie!,
//       gramsPerUnit: gramsPerUnit!,
//       macroNutrition: macroNutrition.toDomain(),
//       isVegetable: isVegetable!,
//     );
//   }
// }

// extension MacroNutritionCMToDomain on MacroNutritionCM {
//   MacroNutrition toDomain() {
//     return MacroNutrition(
//       carbohydrate: carbohydrate!,
//       protein: protein!,
//       fat: fat!,
//     );
//   }
// }

// extension SelectedFoodCMToDomain on SelectedFoodCM {
//   SelectedFood toDomain(Food food, UnitOfMeasurement unitOfMeasurement) {
//     return SelectedFood(
//         food: food,
//         unitOfMeasurement: unitOfMeasurement,
//         numberOfUnitOfMeasurement: numberOfUnitOfMeasurement!,
//         selectedDate: selectedDate!,
//         totalWeight: totalWeight!);
//   }
// }

// extension foodIdToDomain on int {
//   Food toDomain() {
//     return Food(
//         name: name,
//         calorie: calorie,
//         gramsPerUnit: gramsPerUnit,
//         macroNutrition: macroNutrition,
//         isVegetable: isVegetable);
//   }
// }
