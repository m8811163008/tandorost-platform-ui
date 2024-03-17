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
      ),
    );
  }
}

extension UnitOfMeasurementCMToDomain on UnitOfMeasurmentCM {
  UnitOfMeasurement toDomain() {
    return UnitOfMeasurement(
      howManyGrams: howManyGrams,
      icon: icon.toIcon(),
      title: title,
    );
  }
}

extension on String {
  IoniconsData toIcon() => switch (this) {
        'accessibility' => Ionicons.accessibility,
        _ => throw Exception('Not definded unit of measurement')
      };
}
