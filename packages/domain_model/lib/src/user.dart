import 'package:domain_model/domain_model.dart';

class User {
  const User({this.selectedFoods = const []});

  final List<SelectedFood> selectedFoods;
}

class SelectedFood extends Food {
  /// Utc time
  final DateTime? selectedDate;

  /// shows number of units of measurement selected
  final int? measurementUnitCount;
  final UnitOfMeasurement? unitOfMeasurement;

  const SelectedFood({
    required super.name,
    super.calorie,
    super.gramsPerUnit,
    super.macroNutrition,
    this.selectedDate,
    this.measurementUnitCount,
    this.unitOfMeasurement,
  });

  static SelectedFood get empty => SelectedFood(
        name: 'initial',
        selectedDate: DateTime.now(),
        measurementUnitCount: 0,
      );

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
      selectedDate: eatDate ?? this.selectedDate,
      measurementUnitCount: measurementUnitCount ?? this.measurementUnitCount,
      unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
    );
  }
}
