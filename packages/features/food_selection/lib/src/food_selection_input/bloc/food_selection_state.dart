// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'food_selection_bloc.dart';

class FoodSelectionState {
  final String query;
  final List<FoodCM> searchedFoods;
  final ProcessAsyncStatus searchFoodStatus;
  final SelectedFoodCM selectedFood;
  final List<UnitOfMeasurement> unitOfMesurementList;
  final Duration saveTimeOffset;
  final ProcessAsyncStatus upsertSelectedFoodStatus;
  final Map<UnitOfMeasurement, int> unitOfMeasurementHistory;

  FoodSelectionState({
    this.query = '',
    this.searchedFoods = const [],
    this.unitOfMesurementList = const [],
    this.searchFoodStatus = ProcessAsyncStatus.initial,
    this.upsertSelectedFoodStatus = ProcessAsyncStatus.initial,
    this.saveTimeOffset = Duration.zero,
    this.unitOfMeasurementHistory = const {},
    SelectedFoodCM? selectedFood,
  }) : selectedFood = selectedFood ?? SelectedFoodCM.empty();

  FoodSelectionState copyWith({
    String? query,
    List<FoodCM>? searchedFoods,
    ProcessAsyncStatus? searchFoodStatus,
    SelectedFoodCM? selectedFood,
    List<UnitOfMeasurement>? unitOfMesurementList,
    Duration? saveTimeOffset,
    ProcessAsyncStatus? upsertSelectedFoodStatus,
    Map<UnitOfMeasurement, int>? unitOfMeasurementHistory,
  }) {
    return FoodSelectionState(
      query: query ?? this.query,
      searchedFoods: searchedFoods ?? this.searchedFoods,
      searchFoodStatus: searchFoodStatus ?? this.searchFoodStatus,
      selectedFood: selectedFood ?? this.selectedFood,
      unitOfMesurementList: unitOfMesurementList ?? this.unitOfMesurementList,
      saveTimeOffset: saveTimeOffset ?? this.saveTimeOffset,
      upsertSelectedFoodStatus:
          upsertSelectedFoodStatus ?? this.upsertSelectedFoodStatus,
      unitOfMeasurementHistory:
          unitOfMeasurementHistory ?? this.unitOfMeasurementHistory,
    );
  }
}
