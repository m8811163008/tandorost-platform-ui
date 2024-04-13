// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_foods_list_cubit.dart';

class SelectedFoodsListState {
  final ProcessAsyncStatus deleteSelectedFoodStatus;
  final DateTimeRange filterSelctedFoodsListDateTimeRange;
  final SelectedFoodCM? lastDeletedSelectedFood;
  final List<SelectedFoodCM> selectedFoodsList;
  final Set<SelectedFoodCM> selectedFoodsForNewFood;
  final ProcessAsyncStatus creatingNewFood;
  final ProcessAsyncStatus upsertSelectedFoodStatus;
  final String newFoodName;

  SelectedFoodsListState({
    this.selectedFoodsList = const [],
    this.selectedFoodsForNewFood = const {},
    this.deleteSelectedFoodStatus = ProcessAsyncStatus.initial,
    this.creatingNewFood = ProcessAsyncStatus.initial,
    this.upsertSelectedFoodStatus = ProcessAsyncStatus.initial,
    SelectedFoodCM? selectedFood,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    SelectedFoodCM? lastDeletedSelectedFood,
    this.newFoodName = '',
  })  : lastDeletedSelectedFood =
            lastDeletedSelectedFood ?? SelectedFoodCM.empty(),
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

  SelectedFoodsListState copyWith({
    ProcessAsyncStatus? deleteSelectedFoodStatus,
    DateTimeRange? filterSelctedFoodsListDateTimeRange,
    SelectedFoodCM? lastDeletedSelectedFood,
    List<SelectedFoodCM>? selectedFoodsList,
    Set<SelectedFoodCM>? selectedFoodsForNewFood,
    ProcessAsyncStatus? creatingNewFood,
    ProcessAsyncStatus? upsertSelectedFoodStatus,
    String? newFoodName,
  }) {
    return SelectedFoodsListState(
      deleteSelectedFoodStatus:
          deleteSelectedFoodStatus ?? this.deleteSelectedFoodStatus,
      filterSelctedFoodsListDateTimeRange:
          filterSelctedFoodsListDateTimeRange ??
              this.filterSelctedFoodsListDateTimeRange,
      lastDeletedSelectedFood:
          lastDeletedSelectedFood ?? this.lastDeletedSelectedFood,
      selectedFoodsList: selectedFoodsList ?? this.selectedFoodsList,
      selectedFoodsForNewFood:
          selectedFoodsForNewFood ?? this.selectedFoodsForNewFood,
      creatingNewFood: creatingNewFood ?? this.creatingNewFood,
      upsertSelectedFoodStatus:
          upsertSelectedFoodStatus ?? this.upsertSelectedFoodStatus,
      newFoodName: newFoodName ?? this.newFoodName,
    );
  }
}
