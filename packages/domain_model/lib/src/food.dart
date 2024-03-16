import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String name;
  final int? calorie;
  final int? gramsPerUnit;
  final MacroNutrition? macroNutrition;

  const Food(
      {required this.name,
      this.calorie,
      this.gramsPerUnit,
      this.macroNutrition});

  @override
  List<Object?> get props => [name, calorie, gramsPerUnit, macroNutrition];
}

class MacroNutrition extends Equatable {
  final int? carbohydrate;
  final int? fat;
  final int? protein;

  const MacroNutrition({this.carbohydrate, this.fat, this.protein});
  @override
  List<Object?> get props => [
        carbohydrate,
        fat,
        protein,
      ];
}
