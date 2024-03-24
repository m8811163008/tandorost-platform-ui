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
  // create empty food
  static Food empty() => Food(name: '', macroNutrition: MacroNutrition());

  //to string
  @override
  String toString() {
    return 'Food{name: $name, calorie: $calorie, gramsPerUnit: $gramsPerUnit, macroNutrition: $macroNutrition}';
  }

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
