// import 'package:flutter/material.dart';

// import 'package:equatable/equatable.dart';

// class Food extends Equatable {
//   final String name;
//   // calorie per 100 grams
//   final int calorie;
//   // gram per one unit of food for example each apple is 100 grams
//   final int gramsPerUnit;
//   // Actual value of macro nutritions per 100gr
//   final MacroNutrition macroNutrition;
//   final bool isVegetable;

//   factory Food.empty() {
//     return Food(
//       name: '',
//       calorie: -1,
//       gramsPerUnit: -1,
//       macroNutrition: MacroNutrition.empty(),
//       isVegetable: false,
//     );
//   }

//   Food(
//       {required this.name,
//       required this.calorie,
//       required this.gramsPerUnit,
//       required this.macroNutrition,
//       required this.isVegetable});

//   @override
//   List<Object?> get props => [
//         name,
//         calorie,
//         gramsPerUnit,
//         macroNutrition,
//       ];

//   //copywith

//   Food copyWith(
//       {String? name,
//       int? calorie,
//       int? gramsPerUnit,
//       MacroNutrition? macroNutrition,
//       bool? isVegetable}) {
//     return Food(
//         name: name ?? this.name,
//         calorie: calorie ?? this.calorie,
//         gramsPerUnit: gramsPerUnit ?? this.gramsPerUnit,
//         macroNutrition: macroNutrition ?? this.macroNutrition,
//         isVegetable: isVegetable ?? this.isVegetable);
//   }
// }

// // Actual values per 100 grams
// class MacroNutrition extends Equatable {
//   final double carbohydrate;
//   final double fat;
//   final double protein;

//   factory MacroNutrition.empty() {
//     return MacroNutrition(
//       carbohydrate: -1.0,
//       fat: -1.0,
//       protein: -1.0,
//     );
//   }

//   MacroNutrition(
//       {required this.carbohydrate, required this.fat, required this.protein});

//   @override
//   List<Object?> get props => [carbohydrate, fat, protein];

//   MacroNutrition copyWith(
//       {double? carbohydrate, double? fat, double? protein}) {
//     return MacroNutrition(
//         carbohydrate: carbohydrate ?? this.carbohydrate,
//         fat: fat ?? this.fat,
//         protein: protein ?? this.protein);
//   }
// }
