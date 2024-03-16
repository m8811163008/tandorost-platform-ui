import 'package:domain_model/domain_model.dart';

class User {
  const User({this.selectedFoods = const []});

  final List<SelectedFoodCM> selectedFoods;
}

class SelectedFoodCM extends Food {
  /// Utc time
  final DateTime selectedDate;

  /// shows number of units of measurement selected
  final int numberOfUnitOfMeasurement;
  final UnitOfMeasurement unitOfMeasurement;

  const SelectedFoodCM({
    required super.name,
    super.calorie,
    super.gramsPerUnit,
    super.macroNutrition,
    required this.selectedDate,
    required this.numberOfUnitOfMeasurement,
    required this.unitOfMeasurement,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        selectedDate,
        numberOfUnitOfMeasurement,
        unitOfMeasurement
      ];
}
