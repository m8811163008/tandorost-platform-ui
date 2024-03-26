import 'dart:async';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

part 'food_selection_event.dart';
part 'food_selection_state.dart';

class FoodSelectionBloc extends Bloc<FoodSelectionEvent, FoodSelectionState> {
  FoodSelectionBloc(FoodRepostiory foodRepository)
      : _foodRepository = foodRepository,
        super(FoodSelectionState()) {
    _registerHandlers();

    _foodsSubscription = _foodRepository.searchedFoodsStream.listen((foods) {
      add(SearchedFoodsUpdated(foods));
    });

    add(
      // TODO add this event when the proper pages open
      SlectedFoodListFiltered(
          dateTimeRange: state.filterSelctedFoodsListDateTimeRange),
    );
  }

  final FoodRepostiory _foodRepository;
  late final StreamSubscription<List<Food>> _foodsSubscription;
  late StreamSubscription<List<SelectedFood>> _selectedFoodStreamSubscription;

  @override
  Future<void> close() async {
    await _foodsSubscription.cancel();
    await _selectedFoodStreamSubscription.cancel();
    await _foodRepository.dispose();
    return super.close();
  }

  void _registerHandlers() {
    on<FoodSelectionEvent>((event, emit) async {
      if (event is SearchFood) {
        await _handleSearchFood(event, emit);
      } else if (event is SearchedFoodsUpdated) {
        _handleSearchedFoodsUpdated(event, emit);
      } else if (event is FoodSelected) {
        await _handleFoodSelected(event, emit);
      } else if (event is SelectedFoodUpdated) {
        _handleSelectedFoodUpdated(event, emit);
      } else if (event is SelectedFoodSaved) {
        await _handleSelectedFoodSaved(emit);
      } else if (event is SelectedFoodsListFetched) {
        _handleSelectedFoodsListFetched(event, emit);
      } else if (event is SearchFoodFormReset) {
        _handleResetState(emit);
      } else if (event is SlectedFoodListFiltered) {
        await _handleSlectedFoodListFiltered(event, emit);
      } else if (event is SelectedFoodRemoved) {
        await _handleSelectedFoodRemoved(event, emit);
      } else if (event is SelectedFoodUndoRemoved) {
        await _handleSelectedFoodUndoRemoved(event, emit);
      }
    });
  }

  Future<void> _handleSlectedFoodListFiltered(
      SlectedFoodListFiltered event, Emitter<FoodSelectionState> emit) async {
    _selectedFoodStreamSubscription = _foodRepository
        .selectedFoodsListStream(dateTimeRange: event.dateTimeRange)
        .listen((selectedFoodList) {
      add(SelectedFoodsListFetched(selectedFoods: selectedFoodList));
    });
    emit(state.copyWith(
        filterSelctedFoodsListDateTimeRange: event.dateTimeRange));
  }

  Future<void> _handleSelectedFoodRemoved(
      SelectedFoodRemoved event, Emitter<FoodSelectionState> emit) async {
    emit(
      state.copyWith(
        deleteSelectedFoodStatus: FetchDataStatus.loading,
        lastDeletedSelectedFood: event.food,
      ),
    );
    try {
      await _foodRepository.removeSelectedFood(event.food);
      emit(state.copyWith(deleteSelectedFoodStatus: FetchDataStatus.loaded));
    } catch (e) {
      emit(state.copyWith(deleteSelectedFoodStatus: FetchDataStatus.error));
    }
  }

  Future<void> _handleSelectedFoodUndoRemoved(
      SelectedFoodUndoRemoved event, Emitter<FoodSelectionState> emit) async {
    assert(state.lastDeletedSelectedFood != SelectedFood.empty(),
        'propebly you call this method to early, or the state reseted');
    // to prevent call this method unnecessasarily.
    if (state.selectedFoodsList.contains(state.lastDeletedSelectedFood)) return;
    emit(
      state.copyWith(
        upsertSelectedFoodStatus: FetchDataStatus.loading,
      ),
    );
    try {
      await _foodRepository.upsertSelectedFood(state.lastDeletedSelectedFood!);
      emit(
        state.copyWith(
          upsertSelectedFoodStatus: FetchDataStatus.loaded,
        ),
      );
    } catch (e) {
      emit(state.copyWith(upsertSelectedFoodStatus: FetchDataStatus.error));
    }
  }

  void _handleSearchedFoodsUpdated(
      SearchedFoodsUpdated event, Emitter<FoodSelectionState> emit) {
    emit(state.copyWith(
        searchedFoods: event.foods, searchFoodStatus: FetchDataStatus.loaded));
  }

  Future<void> _handleFoodSelected(
      FoodSelected event, Emitter<FoodSelectionState> emit) async {
    List<UnitOfMeasurement> units = await _foodRepository.unitOfMeasurement;
    final updatedUnits = units.map((e) {
      if (e.type != UnitOfMeasurementType.gramsPerUnit) return e;
      return e.copyWith(
        howManyGrams: event.food.gramsPerUnit,
        max: _calculateGramsPerUnitMax(event.food.gramsPerUnit),
      );
    }).toList();

    emit(
      state.copyWith(
        unitOfMesurementList: updatedUnits,
        selectedFood: state.selectedFood.copyWith(
          name: event.food.name,
          calorie: event.food.calorie,
          gramsPerUnit: event.food.gramsPerUnit,
          macroNutrition: event.food.macroNutrition,
          unitOfMeasurement: updatedUnits.first,
        ),
      ),
    );
  }

  /// Calculates the maximum grams per unit based on the given [gramsPerUnit].
  /// Returns the calculated value or `null` if [gramsPerUnit] is `null`.
  int? _calculateGramsPerUnitMax(int? gramsPerUnit) {
    if (gramsPerUnit == null) return null;
    if (gramsPerUnit < 10) {
      return 20;
    } else if (gramsPerUnit < 50) {
      return 15;
    } else {
      return 10;
    }
  }

  Future<void> _handleSearchFood(
      SearchFood event, Emitter<FoodSelectionState> emit) async {
    emit(state.copyWith(
        query: event.query, searchFoodStatus: FetchDataStatus.loading));
    try {
      await _foodRepository.searchFoods(event.query);
    } catch (e) {
      emit(state.copyWith(
          query: event.query, searchFoodStatus: FetchDataStatus.error));
    }
  }

  void _handleSelectedFoodUpdated(
      SelectedFoodUpdated event, Emitter<FoodSelectionState> emit) {
    emit(
      state.copyWith(
        saveTimeOffset: event.saveEatDateTimeOffset,
        selectedFood: state.selectedFood.copyWith(
          measurementUnitCount: event.measurementUnitCount,
          unitOfMeasurement: event.unitOfMeasurement,
        ),
      ),
    );
  }

  Future<void> _handleSelectedFoodSaved(
      Emitter<FoodSelectionState> emit) async {
    try {
      // this.selectedDate,
      // this.measurementUnitCount,
      // this.unitOfMeasurement,
      emit(
        state.copyWith(upsertSelectedFoodStatus: FetchDataStatus.loading),
      );
      await _foodRepository.upsertSelectedFood(
        state.selectedFood.copyWith(
          eatDate: DateTime.now().add(state.saveTimeOffset).toUtc(),
        ),
      );

      emit(
        state.copyWith(upsertSelectedFoodStatus: FetchDataStatus.loaded),
      );
    } catch (e) {
      emit(
        state.copyWith(upsertSelectedFoodStatus: FetchDataStatus.error),
      );
    }
  }

  void _handleSelectedFoodsListFetched(
      SelectedFoodsListFetched event, Emitter<FoodSelectionState> emit) {
    final selectedFoodsList = event.selectedFoods;
    selectedFoodsList.sort((a, b) => a.selectedDate.compareTo(b.selectedDate));
    emit(
      state.copyWith(selectedFoodsList: selectedFoodsList),
    );
  }

  void _handleResetState(Emitter<FoodSelectionState> emit) {
    emit(FoodSelectionState());
    add(
      SlectedFoodListFiltered(
        dateTimeRange: state.filterSelctedFoodsListDateTimeRange,
      ),
    );
  }
}
