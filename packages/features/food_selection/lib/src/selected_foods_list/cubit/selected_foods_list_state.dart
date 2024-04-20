// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_foods_list_cubit.dart';

class SelectedFoodsListState {
  final ProcessAsyncStatus deleteSelectedFoodStatus;
  final DateTimeRange filterSelctedFoodsListDateTimeRange;
  final List<SelectedFoodCM> lastDeletedSelectedFoods;
  final List<SelectedFoodCM> selectedFoodsList;

  final ProcessAsyncStatus undoRemoveSelectedFoodStatus;
  final String newFoodName;
  final Set<SelectedFoodCM> selectedFoodsForNewFood;
  final ProcessAsyncStatus creatingNewFoodFromSelectionStatus;
  //  final ProcessAsyncStatus creatingNewFood;
  final DietInfo dietInfo;
  final DayActivityLevel dayActivityLevel;
  final SelectedFoodsInfo selectedFoodsInfo;
  final int filterDays;

  SelectedFoodsListState({
    this.selectedFoodsList = const [],
    this.selectedFoodsForNewFood = const {},
    this.deleteSelectedFoodStatus = ProcessAsyncStatus.initial,
    // this.creatingNewFood = ProcessAsyncStatus.initial,
    this.undoRemoveSelectedFoodStatus = ProcessAsyncStatus.initial,
    this.creatingNewFoodFromSelectionStatus = ProcessAsyncStatus.initial,
    SelectedFoodCM? selectedFood,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    this.lastDeletedSelectedFoods = const [],
    this.newFoodName = '',
    this.dayActivityLevel = DayActivityLevel.rest,
    this.dietInfo = const DietInfo.empty(),
    this.selectedFoodsInfo = const SelectedFoodsInfo.empty(),
    this.filterDays = 1,
  }) : filterSelctedFoodsListDateTimeRange =
            filterSelctedFoodsListDateTimeRange ??
                DateTimeRange(
                  start: DateTime.now().copyWith(
                    hour: 0,
                    minute: 0,
                    second: 0,
                  ),
                  end: DateTime.now().add(
                    const Duration(hours: 10),
                  ),
                );

  SelectedFoodsListState copyWith({
    ProcessAsyncStatus? deleteSelectedFoodStatus,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    List<SelectedFoodCM>? lastDeletedSelectedFoods,
    List<SelectedFoodCM>? selectedFoodsList,
    ProcessAsyncStatus? undoRemoveSelectedFoodStatus,
    String? newFoodName,
    Set<SelectedFoodCM>? selectedFoodsForNewFood,
    ProcessAsyncStatus? creatingNewFoodFromSelectionStatus,
    DietInfo? dietInfo,
    DayActivityLevel? dayActivityLevel,
    SelectedFoodsInfo? selectedFoodsInfo,
    int? filterDays,
  }) {
    return SelectedFoodsListState(
      deleteSelectedFoodStatus:
          deleteSelectedFoodStatus ?? this.deleteSelectedFoodStatus,
      filterSelctedFoodsListDateTimeRange:
          filterSelctedFoodsListDateTimeRange ??
              this.filterSelctedFoodsListDateTimeRange,
      lastDeletedSelectedFoods:
          lastDeletedSelectedFoods ?? this.lastDeletedSelectedFoods,
      selectedFoodsList: selectedFoodsList ?? this.selectedFoodsList,
      undoRemoveSelectedFoodStatus:
          undoRemoveSelectedFoodStatus ?? this.undoRemoveSelectedFoodStatus,
      newFoodName: newFoodName ?? this.newFoodName,
      selectedFoodsForNewFood:
          selectedFoodsForNewFood ?? this.selectedFoodsForNewFood,
      creatingNewFoodFromSelectionStatus: creatingNewFoodFromSelectionStatus ??
          this.creatingNewFoodFromSelectionStatus,
      dietInfo: dietInfo ?? this.dietInfo,
      dayActivityLevel: dayActivityLevel ?? this.dayActivityLevel,
      selectedFoodsInfo: selectedFoodsInfo ?? this.selectedFoodsInfo,
      filterDays: filterDays ?? this.filterDays,
    );
  }

// ceil the days to include last 24 hours in calculation because our calculation is base on 24 hours of RMR.
}
