// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: 1)
class FoodCM {
  @HiveField(0)
  final String name;

  // Calaries per 1 grams of this food.
  @HiveField(1)
  final int calorie;

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
  factory FoodCM.empty() {
    return FoodCM(
      name: '',
      calorie: -1,
      gramsPerUnit: -1,
      macroNutrition: MacroNutritionCM.empty(),
      isVegetable: false,
    );
  }

  FoodCM copyWith({
    String? name,
    int? calorie,
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

@HiveType(typeId: 2)
class MacroNutritionCM {
  @HiveField(0)
  final double carbohydrate;
  @HiveField(1)
  final double fat;
  @HiveField(2)
  final double protein;

  MacroNutritionCM({
    required this.carbohydrate,
    required this.fat,
    required this.protein,
  });
  factory MacroNutritionCM.empty() {
    return MacroNutritionCM(
      carbohydrate: -1,
      fat: -1,
      protein: -1,
    );
  }

  double get totalWeight {
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
