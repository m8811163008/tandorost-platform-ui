part of 'food_selection_bloc.dart';

class FoodSelectionState {
  final String query;
  final List<Food> foods;
  final List<SelectedFood> selectedFoodsList;
  final FetchDataStatus status;
  final SelectedFood? selectedFood;
  final List<UnitOfMeasurement> unitOfMesurementList;
  final Duration saveTimeOffset;
  final FetchDataStatus upsertSelectedFoodStatus;
  final DateTimeRange? filterSelctedFoodsListDateTimeRange;

  const FoodSelectionState(
      {this.query = '',
      this.foods = const [],
      this.unitOfMesurementList = const [],
      this.selectedFoodsList = const [],
      this.status = FetchDataStatus.initial,
      this.upsertSelectedFoodStatus = FetchDataStatus.initial,
      this.selectedFood,
      this.saveTimeOffset = Duration.zero,
      this.filterSelctedFoodsListDateTimeRange});

  FoodSelectionState copyWith({
    String? query,
    List<Food>? foods,
    FetchDataStatus? status,
    FetchDataStatus? upsertSelectedFoodStatus,
    SelectedFood? selectedFood,
    List<UnitOfMeasurement>? unitOfMesurementList,
    Duration? saveTimeOffset,
    List<SelectedFood>? selectedFoodsList,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
  }) {
    return FoodSelectionState(
      query: query ?? this.query,
      foods: foods ?? this.foods,
      status: status ?? this.status,
      selectedFood: selectedFood ?? this.selectedFood,
      unitOfMesurementList: unitOfMesurementList ?? this.unitOfMesurementList,
      saveTimeOffset: saveTimeOffset ?? this.saveTimeOffset,
      upsertSelectedFoodStatus:
          upsertSelectedFoodStatus ?? this.upsertSelectedFoodStatus,
      selectedFoodsList: selectedFoodsList ?? this.selectedFoodsList,
      filterSelctedFoodsListDateTimeRange:
          filterSelctedFoodsListDateTimeRange ??
              this.filterSelctedFoodsListDateTimeRange,
    );
  }
}

extension on Food {
  SelectedFood toSelectedFood(UnitOfMeasurement unitOfMeasurement) {
    return SelectedFood(
      name: name,
      gramsPerUnit: gramsPerUnit,
      macroNutrition: macroNutrition,
      unitOfMeasurement: unitOfMeasurement,
      calorie: calorie,
    );
  }
}
