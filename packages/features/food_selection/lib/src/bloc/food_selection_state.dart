part of 'food_selection_bloc.dart';

class FoodSelectionState {
  final String query;
  final List<Food> foods;
  final FetchDataStatus status;
  final SelectedFood? selectedFood;
  final List<UnitOfMeasurement> unitOfMesurementList;

  const FoodSelectionState({
    this.query = '',
    this.foods = const [],
    this.unitOfMesurementList = const [],
    this.status = FetchDataStatus.initial,
    this.selectedFood,
  });

  FoodSelectionState copyWith({
    String? query,
    List<Food>? foods,
    FetchDataStatus? status,
    SelectedFood? selectedFood,
    List<UnitOfMeasurement>? unitOfMesurementList,
  }) {
    return FoodSelectionState(
      query: query ?? this.query,
      foods: foods ?? this.foods,
      status: status ?? this.status,
      selectedFood: selectedFood ?? this.selectedFood,
      unitOfMesurementList: unitOfMesurementList ?? this.unitOfMesurementList,
    );
  }
}

extension on Food {
  SelectedFood toSelectedFood(UnitOfMeasurement unitOfMeasurement) {
    return SelectedFood(
      name: name,
      calorie: calorie,
      gramsPerUnit: gramsPerUnit,
      macroNutrition: macroNutrition,
    );
  }
}
