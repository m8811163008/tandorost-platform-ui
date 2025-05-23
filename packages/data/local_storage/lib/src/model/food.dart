// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
import 'package:local_storage/src/model/model.dart';

part 'food.g.dart';

@HiveType(typeId: TypeIDs.foodCM)
class FoodCM {
  @HiveField(0)
  final String name;

  // Calaries per 1 grams of this food.
  @HiveField(1)
  final double calorie;

  /// gram per one unit of food for example each apple is 100 grams
  @HiveField(2)
  final int gramsPerUnit;

  /// The actual value of macro nutrition of the food per 1 gram.
  ///
  /// For example 1 grams of apple has 0.003g protein and 0.004g fat and 0.005g carbohydrate.
  @HiveField(3)
  final MacroNutritionCM macroNutrition;

  @HiveField(4)

  /// Whether this food is vegetable or fruit or not.
  final bool isVegetable;

  const FoodCM(
      {required this.name,
      required this.calorie,
      required this.gramsPerUnit,
      required this.macroNutrition,
      required this.isVegetable});
  const FoodCM.empty()
      : name = '',
        calorie = -1,
        gramsPerUnit = -1,
        macroNutrition = const MacroNutritionCM.empty(),
        isVegetable = false;

  FoodCM copyWith({
    String? name,
    double? calorie,
    int? gramsPerUnit,
    MacroNutritionCM? macroNutrition,
    bool? isVegetable,
  }) {
    return FoodCM(
      name: name ?? this.name,
      calorie: calorie ?? this.calorie,
      gramsPerUnit: gramsPerUnit ?? this.gramsPerUnit,
      macroNutrition: macroNutrition ?? this.macroNutrition,
      isVegetable: isVegetable ?? this.isVegetable,
    );
  }

  @override
  bool operator ==(covariant FoodCM other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode {
    return name.hashCode;
  }
}

/// The actual value of macro nutrition of the food per 1 gram.
///
/// For example 1 grams of apple has 0.003g protein and 0.004g fat and 0.005g carbohydrate.

@HiveType(typeId: TypeIDs.macroNutritionCM)
class MacroNutritionCM {
  @HiveField(0)
  final double carbohydrate;
  @HiveField(1)
  final double fat;
  @HiveField(2)
  final double protein;

  const MacroNutritionCM({
    required this.carbohydrate,
    required this.fat,
    required this.protein,
  });
  const MacroNutritionCM.empty()
      : carbohydrate = -1,
        fat = -1,
        protein = -1;

  double get sum {
    final sum = carbohydrate + fat + protein;
    // if (sum > 1.0) throw Exception('sum is more than 1 gram');
    return sum;
  }

  MacroNutritionCM copyWith(
      {double? carbohydrate, double? fat, double? protein}) {
    return MacroNutritionCM(
        carbohydrate: carbohydrate ?? this.carbohydrate,
        fat: fat ?? this.fat,
        protein: protein ?? this.protein);
  }
}
