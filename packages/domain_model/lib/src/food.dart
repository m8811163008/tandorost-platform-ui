import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String name;
  // calorie per 100 grams
  final int? calorie;
  // 1 gram weight of each unit
  final int? gramsPerUnit;
  // percent of macro Nutrition per 100 grams
  final MacroNutrition? macroNutrition;

  const Food({
    required this.name,
    this.calorie,
    this.gramsPerUnit,
    this.macroNutrition,
  });

  @override
  List<Object?> get props => [
        name,
        calorie,
        gramsPerUnit,
        macroNutrition,
      ];
}

class MacroNutrition extends Equatable {
  final double? carbohydrate;
  final double? fat;
  final double? protein;
  final bool isVegetable;

  const MacroNutrition({
    this.carbohydrate,
    this.fat,
    this.protein,
    this.isVegetable = false,
  });
  @override
  List<Object?> get props => [carbohydrate, fat, protein, isVegetable];

  double get sum => (carbohydrate ?? 0) + (fat ?? 0) + (protein ?? 0);
}
