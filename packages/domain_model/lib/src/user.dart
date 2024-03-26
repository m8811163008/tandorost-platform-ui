import 'package:domain_model/domain_model.dart';

class User {
  const User({this.selectedFoods = const []});

  final List<SelectedFood> selectedFoods;
}

class SelectedFood extends Food {
  /// Utc time
  final DateTime selectedDate;

  /// shows number of units of measurement selected
  final int measurementUnitCount;

  /// Selected unit of measurement
  final UnitOfMeasurement unitOfMeasurement;

  const SelectedFood({
    required super.name,
    required super.calorie,
    required super.gramsPerUnit,
    required super.macroNutrition,
    required this.selectedDate,
    required this.measurementUnitCount,
    required this.unitOfMeasurement,
  });

  factory SelectedFood.empty() => SelectedFood(
        name: '',
        calorie: 0,
        gramsPerUnit: 0,
        macroNutrition: MacroNutrition.empty,
        selectedDate: DateTime.now(),
        measurementUnitCount: 0,
        unitOfMeasurement: UnitOfMeasurement.empty(),
      );

  double get _caloriePerGram => super.calorie / 100;

  int calculateActualCalorie() {
    switch (unitOfMeasurement.type) {
      case UnitOfMeasurementType.grams:
        return (_caloriePerGram * measurementUnitCount).toInt();
      case UnitOfMeasurementType.tableSpoon:
        if (unitOfMeasurement.howManyGrams == null)
          throw Exception('unitOfMeasurement.howManyGrams == null');
        return (_caloriePerGram *
                measurementUnitCount *
                unitOfMeasurement.howManyGrams!)
            .toInt();
      case UnitOfMeasurementType.calorie:
        return measurementUnitCount;
      case UnitOfMeasurementType.gramsPerUnit:
        return (_caloriePerGram * measurementUnitCount * gramsPerUnit).toInt();
      default:
        throw Exception('Not handle UnitOfMeasurementType');
    }
  }

  @override
  List<Object?> get props =>
      [...super.props, selectedDate, measurementUnitCount, unitOfMeasurement];

// merge
  SelectedFood copyWith({
    String? name,
    int? calorie,
    int? gramsPerUnit,
    MacroNutrition? macroNutrition,
    DateTime? eatDate,
    int? measurementUnitCount,
    UnitOfMeasurement? unitOfMeasurement,
  }) {
    return SelectedFood(
      name: name ?? this.name,
      calorie: calorie ?? this.calorie,
      gramsPerUnit: gramsPerUnit ?? this.gramsPerUnit,
      macroNutrition: macroNutrition ?? this.macroNutrition,
      selectedDate: eatDate ?? selectedDate,
      measurementUnitCount: measurementUnitCount ?? this.measurementUnitCount,
      unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
    );
  }
}
