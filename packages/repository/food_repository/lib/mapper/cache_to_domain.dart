import 'package:local_storage/local_storage.dart';
import 'package:domain_model/domain_model.dart';

extension FoodCMToDomain on FoodCM {
  Food toDomain() {
    return Food(
      name: name,
      calorie: calorie,
      gramsPerUnit: gramsPerUnit,
      macroNutrition: MacroNutrition(
        carbohydrate: macroNutrition?.carbohydrate,
        fat: macroNutrition?.fat,
        protein: macroNutrition?.protein,
        isVegetable: macroNutrition?.isVegetable ?? false,
      ),
    );
  }
}

extension UnitOfMeasurementCMToDomain on UnitOfMeasurmentCM {
  UnitOfMeasurement toDomain() {
    return UnitOfMeasurement(
        howManyGrams: howManyGrams,
        icon: icon.toIcon(),
        max: max,
        type: UnitOfMeasurementType.values
            .singleWhere((element) => element.name == title));
  }
}

extension on String {
  IoniconsData toIcon() => switch (this) {
        'ellipse_outline' => Ionicons.ellipse_outline,
        _ => throw Exception('Not definded unit of measurement')
      };
}

extension SelectedFoodCMToDomain on SelectedFoodCM {
  SelectedFood toDomain() {
    return SelectedFood(
      name: name,
      calorie: calorie,
      gramsPerUnit: gramsPerUnit,
      macroNutrition: MacroNutrition(
        carbohydrate: macroNutrition?.carbohydrate,
        fat: macroNutrition?.fat,
        protein: macroNutrition?.protein,
      ),
      selectedDate: selectedDate,
      measurementUnitCount: numberOfUnits,
      unitOfMeasurement: unitOfMeasurment.toDomain(),
    );
  }
}
