part of 'food_selection_bloc.dart';

class FoodSelectionState {
  final String query;
  final List<Food> searchedFoods;
  final FetchDataStatus searchFoodStatus;

  final SelectedFood selectedFood;
  final List<UnitOfMeasurement> unitOfMesurementList;
  final Duration saveTimeOffset;
  final FetchDataStatus upsertSelectedFoodStatus;
  final FetchDataStatus deleteSelectedFoodStatus;
  final DateTimeRange filterSelctedFoodsListDateTimeRange;
  final SelectedFood lastDeletedSelectedFood;
  final List<SelectedFood> selectedFoodsList;

  FoodSelectionState({
    this.query = '',
    this.searchedFoods = const [],
    this.unitOfMesurementList = const [],
    this.selectedFoodsList = const [],
    this.searchFoodStatus = FetchDataStatus.initial,
    this.upsertSelectedFoodStatus = FetchDataStatus.initial,
    this.deleteSelectedFoodStatus = FetchDataStatus.initial,
    this.saveTimeOffset = Duration.zero,
    SelectedFood? selectedFood,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    SelectedFood? lastDeletedSelectedFood,
  })  : selectedFood = selectedFood ?? SelectedFood.empty(),
        lastDeletedSelectedFood =
            lastDeletedSelectedFood ?? SelectedFood.empty(),
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
    List<Food>? searchedFoods,
    FetchDataStatus? searchFoodStatus,
    FetchDataStatus? upsertSelectedFoodStatus,
    FetchDataStatus? deleteSelectedFoodStatus,
    SelectedFood? selectedFood,
    SelectedFood? lastDeletedSelectedFood,
    List<UnitOfMeasurement>? unitOfMesurementList,
    Duration? saveTimeOffset,
    List<SelectedFood>? selectedFoodsList,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
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
    );
  }
}
