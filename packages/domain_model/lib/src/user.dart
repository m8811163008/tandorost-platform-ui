import 'package:domain_model/domain_model.dart';

class User {
  const User({this.selectedFoods = const []});

  final List<SelectedFood> selectedFoods;
}

class SelectedFood extends Food {
  /// Utc time
  final DateTime? selectedDate;

  /// shows number of units of measurement selected
  final int? numberOfUnitOfMeasurement;
  final UnitOfMeasurement? unitOfMeasurement;

  const SelectedFood({
    required super.name,
    super.calorie,
    super.gramsPerUnit,
    super.macroNutrition,
    this.selectedDate,
    this.numberOfUnitOfMeasurement,
    this.unitOfMeasurement,
  });

  static SelectedFood get empty => SelectedFood(
      name: 'initial',
      selectedDate: DateTime.now(),
      numberOfUnitOfMeasurement: 0,
      unitOfMeasurement: UnitOfMeasurement.empty);

  @override
  List<Object?> get props => [
        ...super.props,
        selectedDate,
        numberOfUnitOfMeasurement,
        unitOfMeasurement
      ];
}
