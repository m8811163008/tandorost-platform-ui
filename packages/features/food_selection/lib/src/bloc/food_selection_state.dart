part of 'food_selection_bloc.dart';

class FoodSelectionState {
  final String query;
  final List<FoodCM> searchedFoods;
  final ProcessAsyncStatus searchFoodStatus;

  final SelectedFoodCM selectedFood;
  final List<UnitOfMeasurement> unitOfMesurementList;
  final Duration saveTimeOffset;
  final ProcessAsyncStatus upsertSelectedFoodStatus;
  final ProcessAsyncStatus deleteSelectedFoodStatus;
  final DateTimeRange filterSelctedFoodsListDateTimeRange;
  final SelectedFoodCM lastDeletedSelectedFood;
  final List<SelectedFoodCM> selectedFoodsList;
  final Set<SelectedFoodCM> selectedFoodsForNewFood;
  final ProcessAsyncStatus creatingNewFood;
  final String newFoodName;
  final Map<UnitOfMeasurement, int> unitOfMeasurementHistory;

  FoodSelectionState({
    this.query = '',
    this.searchedFoods = const [],
    this.unitOfMesurementList = const [],
    this.selectedFoodsList = const [],
    this.selectedFoodsForNewFood = const {},
    this.searchFoodStatus = ProcessAsyncStatus.initial,
    this.upsertSelectedFoodStatus = ProcessAsyncStatus.initial,
    this.deleteSelectedFoodStatus = ProcessAsyncStatus.initial,
    this.creatingNewFood = ProcessAsyncStatus.initial,
    this.saveTimeOffset = Duration.zero,
    this.unitOfMeasurementHistory = const {},
    SelectedFoodCM? selectedFood,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    SelectedFoodCM? lastDeletedSelectedFood,
    this.newFoodName = '',
  })  : selectedFood = selectedFood ?? SelectedFoodCM(),
        lastDeletedSelectedFood = lastDeletedSelectedFood ?? SelectedFoodCM(),
        filterSelctedFoodsListDateTimeRange =
            filterSelctedFoodsListDateTimeRange ??
                DateTimeRange(
                  start: DateTime.now().copyWith(
                    hour: 0,
                    minute: 0,
                    second: 0,
                  ),
                  end: DateTime.now().add(
                    const Duration(hours: 6),
                  ),
                );

  FoodSelectionState copyWith({
    String? query,
    List<FoodCM>? searchedFoods,
    ProcessAsyncStatus? searchFoodStatus,
    ProcessAsyncStatus? upsertSelectedFoodStatus,
    ProcessAsyncStatus? deleteSelectedFoodStatus,
    SelectedFoodCM? selectedFood,
    SelectedFoodCM? lastDeletedSelectedFood,
    List<UnitOfMeasurement>? unitOfMesurementList,
    Duration? saveTimeOffset,
    List<SelectedFoodCM>? selectedFoodsList,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    Map<UnitOfMeasurement, int>? unitOfMeasurementHistory,
    Set<SelectedFoodCM>? selectedFoodsForNewFood,
    ProcessAsyncStatus? creatingNewFood,
    String? newFoodName,
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
      selectedFoodsList: selectedFoodsList ?? this.selectedFoodsList,
      lastDeletedSelectedFood:
          lastDeletedSelectedFood ?? this.lastDeletedSelectedFood,
      filterSelctedFoodsListDateTimeRange:
          filterSelctedFoodsListDateTimeRange ??
              this.filterSelctedFoodsListDateTimeRange,
      deleteSelectedFoodStatus:
          deleteSelectedFoodStatus ?? this.deleteSelectedFoodStatus,
      unitOfMeasurementHistory:
          unitOfMeasurementHistory ?? this.unitOfMeasurementHistory,
      selectedFoodsForNewFood:
          selectedFoodsForNewFood ?? this.selectedFoodsForNewFood,
      creatingNewFood: creatingNewFood ?? this.creatingNewFood,
      newFoodName: newFoodName ?? this.newFoodName,
    );
  }
}
