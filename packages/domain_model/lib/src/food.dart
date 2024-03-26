import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Food extends Equatable {
  final String name;
  // calorie per 100 grams
  final int calorie;
  // 1 gram weight of each unit for example each apple is 100 grams
  final int gramsPerUnit;
  // Actual value of macro nutritions
  final MacroNutrition macroNutrition;

  const Food({
    required this.name,
    required this.calorie,
    required this.gramsPerUnit,
    required this.macroNutrition,
  });

  @override
  List<Object?> get props => [
        name,
        calorie,
        gramsPerUnit,
        macroNutrition,
      ];
  // create empty food
  factory Food.empty() => Food(
        name: '',
        macroNutrition: MacroNutrition.empty,
        calorie: 0,
        gramsPerUnit: 0,
      );

  //copywith
  Food copyWith({
    String? name,
    int? calorie,
    int? gramsPerUnit,
    MacroNutrition? macroNutrition,
  }) {
    return Food(
      name: name ?? this.name,
      calorie: calorie ?? this.calorie,
      gramsPerUnit: gramsPerUnit ?? this.gramsPerUnit,
      macroNutrition: macroNutrition ?? this.macroNutrition,
    );
  }
}

class MacroNutrition extends Equatable {
  final double carbohydrate;
  final double fat;
  final double protein;
  final bool isVegetable;

  const MacroNutrition({
    required this.carbohydrate,
    required this.fat,
    required this.protein,
    required this.isVegetable,
  });
  @override
  List<Object?> get props => [carbohydrate, fat, protein, isVegetable];

  // create empty food
  static const MacroNutrition empty = MacroNutrition(
    carbohydrate: 0,
    fat: 0,
    protein: 0,
    isVegetable: false,
  );

  // double get sum => (carbohydrate ?? 0) + (fat ?? 0) + (protein ?? 0);

  //copy with
  MacroNutrition copyWith({
    double? carbohydrate,
    double? fat,
    double? protein,
    bool? isVegetable,
  }) {
    return MacroNutrition(
      carbohydrate: carbohydrate ?? this.carbohydrate,
      fat: fat ?? this.fat,
      protein: protein ?? this.protein,
      isVegetable: isVegetable ?? this.isVegetable,
    );
  }
}
