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
  }

  final FoodRepostiory _foodRepository;

  void _registerHandlers() {
    on<FoodSelectionEvent>(
      (event, emit) async {
        if (isClosed) return;
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
        } else if (event is UnitOfMeasurementAmountChanged) {
          _handleUnitOfMeasurementAmountChanged(event, emit);
        } else if (event is SearchFoodFormReset) {
          _handleSearchFoodFormReset(emit);
        }
      },
    );
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
      final searchedList = await _foodRepository.searchFoods(event.query);
      emit(
        state.copyWith(
          searchFoodStatus: ProcessAsyncStatus.success,
          searchedFoods: searchedList,
        ),
      );
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
      SelectedFoodCM selectedFood = SelectedFoodCM.empty();
      if (state.selectedFood.unitOfMeasurmentCM.title ==
          UnitOfMeasurementType.calorie.name) {
        selectedFood = state.selectedFood.copyWith(
            totalWeight: state.selectedFood.numberOfUnitOfMeasurement ~/
                state.selectedFood.food.calorie);
      } else {
        selectedFood = state.selectedFood.copyWith(
            totalWeight: state.selectedFood.numberOfUnitOfMeasurement *
                state.selectedFood.unitOfMeasurmentCM.howManyGrams!);
      }
      await _foodRepository.upsertSelectedFood(
        selectedFood.copyWith(
          selectedDate: DateTime.now().add(state.saveTimeOffset).toUtc(),
        ),
      );

      emit(
        state.copyWith(
          upsertSelectedFoodStatus: ProcessAsyncStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(upsertSelectedFoodStatus: ProcessAsyncStatus.error),
      );
    }
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

  void _handleSearchFoodFormReset(Emitter<FoodSelectionState> emit) {
    emit(FoodSelectionState().copyWith(
      unitOfMesurementList: state.unitOfMesurementList,
      unitOfMeasurementHistory: state.unitOfMeasurementHistory,
    ));
  }
}
