// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
import 'package:local_storage/src/model/model.dart';

part 'selected_foods.g.dart';

@HiveType(typeId: TypeIDs.selectedFoodCM)
class SelectedFoodCM {
  @HiveField(0)
  final FoodCM food;

  @HiveField(1)
  final UnitOfMeasurmentCM unitOfMeasurmentCM;

  /// Shows number of units of measurement selected
  @HiveField(2)
  final int numberOfUnitOfMeasurement;

  @HiveField(3)
  final DateTime selectedDate;

  /// Total weight of selected Food
  @HiveField(4)
  final int totalWeight;

  factory SelectedFoodCM.empty() {
    return SelectedFoodCM(
      food: FoodCM.empty(),
      unitOfMeasurmentCM: UnitOfMeasurmentCM.empty(),
      numberOfUnitOfMeasurement: -1,
      selectedDate: DateTime.now(),
      totalWeight: -1,
    );
  }

  SelectedFoodCM({
    required this.food,
    required this.unitOfMeasurmentCM,
    required this.numberOfUnitOfMeasurement,
    required this.selectedDate,
    required this.totalWeight,
  });

  SelectedFoodCM copyWith({
    FoodCM? food,
    UnitOfMeasurmentCM? unitOfMeasurmentCM,
    int? numberOfUnitOfMeasurement,
    DateTime? selectedDate,
    int? totalWeight,
  }) {
    return SelectedFoodCM(
      food: food ?? this.food,
      unitOfMeasurmentCM: unitOfMeasurmentCM ?? this.unitOfMeasurmentCM,
      numberOfUnitOfMeasurement:
          numberOfUnitOfMeasurement ?? this.numberOfUnitOfMeasurement,
      selectedDate: selectedDate ?? this.selectedDate,
      totalWeight: totalWeight ?? this.totalWeight,
    );
  }

  @override
  bool operator ==(covariant SelectedFoodCM other) {
    if (identical(this, other)) return true;

    return other.food == food &&
        other.unitOfMeasurmentCM == unitOfMeasurmentCM &&
        other.numberOfUnitOfMeasurement == numberOfUnitOfMeasurement &&
        other.selectedDate == selectedDate &&
        other.totalWeight == totalWeight;
  }

  @override
  int get hashCode {
    return food.hashCode ^
        unitOfMeasurmentCM.hashCode ^
        numberOfUnitOfMeasurement.hashCode ^
        selectedDate.hashCode ^
        totalWeight.hashCode;
  }
}
