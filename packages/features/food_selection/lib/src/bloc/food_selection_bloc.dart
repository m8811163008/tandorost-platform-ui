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

    add(
      SlectedFoodListFiltered(
        dateTimeRange: state.filterSelctedFoodsListDateTimeRange,
      ),
    );
  }

  final FoodRepostiory _foodRepository;

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
      } else if (event is UnitOfMeasurementAmountChanged) {
        _handleUnitOfMeasurementAmountChanged(event, emit);
      } else if (event is FoodSelectedForNewFood) {
        _handleFoodSelectedForNewFood(event, emit);
      } else if (event is NewFoodFromSelectedFoodsCreated) {
        await _handleNewFoodFromSelectedFoodsCreated(event, emit);
      } else if (event is NewFoodNameUpdated) {
        _handleNewFoodNameUpdated(event, emit);
      }
    });
  }

  Future<void> _handleSlectedFoodListFiltered(
      SlectedFoodListFiltered event, Emitter<FoodSelectionState> emit) async {
    _foodRepository
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
        deleteSelectedFoodStatus: ProcessAsyncStatus.loading,
        lastDeletedSelectedFood: event.food,
      ),
    );
    try {
      await _foodRepository.removeSelectedFood(event.food);
      emit(
          state.copyWith(deleteSelectedFoodStatus: ProcessAsyncStatus.success));
    } catch (e) {
      emit(state.copyWith(deleteSelectedFoodStatus: ProcessAsyncStatus.error));
    }
  }

  Future<void> _handleSelectedFoodUndoRemoved(
      SelectedFoodUndoRemoved event, Emitter<FoodSelectionState> emit) async {
    assert(state.lastDeletedSelectedFood != SelectedFoodCM.empty(),
        'propebly you call this method to early, or the state reseted');
    // to prevent call this method unnecessasarily.
    if (state.selectedFoodsList.contains(state.lastDeletedSelectedFood)) return;
    emit(
      state.copyWith(
        upsertSelectedFoodStatus: ProcessAsyncStatus.loading,
      ),
    );
    try {
      await _foodRepository.upsertSelectedFood(state.lastDeletedSelectedFood);
      emit(
        state.copyWith(
          upsertSelectedFoodStatus: ProcessAsyncStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(upsertSelectedFoodStatus: ProcessAsyncStatus.error));
    }
  }

  void _handleSearchedFoodsUpdated(
      SearchedFoodsUpdated event, Emitter<FoodSelectionState> emit) {
    emit(state.copyWith(
        searchedFoods: event.foods,
        searchFoodStatus: ProcessAsyncStatus.success));
  }

  Future<void> _handleFoodSelected(
      FoodSelected event, Emitter<FoodSelectionState> emit) async {
    List<UnitOfMeasurement> units = await _foodRepository.unitOfMeasurement;
    final updatedUnits = units.map((e) {
      if (e.title != UnitOfMeasurementType.gramsPerUnit) return e;
      return e.copyWith(
        howManyGrams: () => event.food.gramsPerUnit,
        max: () => _calculateGramsPerUnitMax(event.food.gramsPerUnit),
      );
    }).toList();

    emit(
      state.copyWith(
        unitOfMesurementList: updatedUnits,
        selectedFood: state.selectedFood.copyWith(
          food: event.food,
          unitOfMeasurmentCM: updatedUnits.first.toCacheModel(),
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
        query: event.query, searchFoodStatus: ProcessAsyncStatus.loading));
    try {
      await _foodRepository.searchFoods(event.query);
    } catch (e, s) {
      log('message', error: e, stackTrace: s);
      emit(state.copyWith(
          query: event.query, searchFoodStatus: ProcessAsyncStatus.error));
    }
  }

  void _handleSelectedFoodUpdated(
      SelectedFoodUpdated event, Emitter<FoodSelectionState> emit) {
    emit(
      state.copyWith(
        saveTimeOffset: event.saveEatDateTimeOffset,
        selectedFood: state.selectedFood.copyWith(
          numberOfUnitOfMeasurement: event.measurementUnitCount,
          unitOfMeasurmentCM: event.unitOfMeasurement?.toCacheModel(),
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
        state.copyWith(upsertSelectedFoodStatus: ProcessAsyncStatus.loading),
      );
      await _foodRepository.upsertSelectedFood(
        state.selectedFood.copyWith(
          selectedDate: DateTime.now().add(state.saveTimeOffset).toUtc(),
        ),
      );

      emit(
        state.copyWith(upsertSelectedFoodStatus: ProcessAsyncStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(upsertSelectedFoodStatus: ProcessAsyncStatus.error),
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

  void _handleUnitOfMeasurementAmountChanged(
      UnitOfMeasurementAmountChanged event, Emitter<FoodSelectionState> emit) {
    var history =
        Map<UnitOfMeasurement, int>.from(state.unitOfMeasurementHistory);
    history.update(
      event.unitOfMeasurement,
      (_) => event.amount,
      ifAbsent: () => event.amount,
    );
    emit(
      state.copyWith(
        unitOfMeasurementHistory: history,
      ),
    );
  }

  void _handleFoodSelectedForNewFood(
      FoodSelectedForNewFood event, Emitter<FoodSelectionState> emit) {
    final selectedFoodsForNewFood =
        Set<SelectedFoodCM>.from(state.selectedFoodsForNewFood);
    if (state.selectedFoodsForNewFood.contains(event.selectedFood)) {
      //remove
      selectedFoodsForNewFood.remove(event.selectedFood);
    } else {
      selectedFoodsForNewFood.add(event.selectedFood);
    }
    emit(
      state.copyWith(
        selectedFoodsForNewFood: selectedFoodsForNewFood,
      ),
    );
  }

  void _handleNewFoodNameUpdated(
      NewFoodNameUpdated event, Emitter<FoodSelectionState> emit) {
    emit(
      state.copyWith(
        newFoodName: event.value,
      ),
    );
  }

  Future<void> _handleNewFoodFromSelectedFoodsCreated(
      NewFoodFromSelectedFoodsCreated event,
      Emitter<FoodSelectionState> emit) async {
    assert(state.selectedFoodsForNewFood.isNotEmpty);
    emit(
      state.copyWith(
        creatingNewFood: ProcessAsyncStatus.loading,
      ),
    );
    // create FoodCM
    // FoodCM(name: 'Input', calorie: calorie, gramsPerUnit: gramsPerUnit, macroNutrition: macroNutrition);
//     final macroNutrition = state.selectedFoodsForNewFood.fold(MacroNutritionCM(), (previousValue, element) => null)

//     // chandta selectedfood mikhay foodcm besazi
//     final foodCM = FoodCM()
//     ..name = state.newFoodName
//     ..gramsPerUnit = state.selectedFoodsForNewFood.fold(0, (previousValue, element) =>previousValue! + element.totalWeight!)
//     ..isVegetable = state.selectedFoodsForNewFood.fold(true, (previousValue, element) => previousValue! && state.selectedFoodFoodCM.isVegetable!)
//     ..calorie = state.selectedFoodsForNewFood.fold(0, (previousValue, element) =>previousValue! + (element.totalWeight! * state.selectedFoodFoodCM.calorie!))
//     ;

// final foods = await _foodRepository.foodsStream.last;
//     // upsert new food
//     var newFood = state.selectedFoodsForNewFood.fold<SelectedFoodCM>(SelectedFoodCM(),
//         (previousValue, currentValue) {

// final previousValueSelectedFood = state.selectedFoodsForNewFood.singleWhere((whereClauseElement) => whereClauseElement.name == previousValue.name);
// final currentValueSelectedFood = state.selectedFoodsForNewFood.singleWhere((whereClauseElement) => whereClauseElement.name == currentValue.name);

//       final previousValueGramsPerUnitTotal =
//           previousValue.gramsPerUnit * previousValueSelectedFood.;
//       // final elementValueGramsPerUnitTotal = element.gramsPerUnit * 'tedad' ;
//       return previousValue.copyWith(
//         calorie: currentValue.calorie + previousValue.calorie,
//         gramsPerUnit: currentValue.gramsPerUnit + previousValue.gramsPerUnit,
//         macroNutrition: currentValue.macroNutrition + previousValue.macroNutrition,
//       );
//     });
//     // Todo handle is vegetable is approciate
//     newFood = newFood.copyWith(
//       name: state.newFoodName,
//     );
//     try {
//       // dont let to overwrite but inform
//       await _foodRepository.upsertFood(newFood);
//       emit(
//         state.copyWith(
//           creatingNewFood: ProcessAsyncStatus.loaded,
//         ),
//       );
//     } catch (e) {
//       emit(
//         state.copyWith(
//           creatingNewFood: ProcessAsyncStatus.error,
//         ),
//       );
//     }

//     // clear selectedFoodsForNewFood and name
  }
}
