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
        super(const FoodSelectionState()) {
    _registerHandlers();

    _foodsSubscription = _foodRepository.searchedFoodsStream.listen((foods) {
      add(SearchedFoodsUpdated(foods));
    });
  }

  final FoodRepostiory _foodRepository;
  late final StreamSubscription<List<Food>> _foodsSubscription;

  @override
  Future<void> close() {
    _foodsSubscription.cancel();
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
        if (state.selectedFood == null) return;
        if (event.measurementUnitCount ==
            state.selectedFood!.measurementUnitCount) return;
        emit(
          state.copyWith(
            selectedFood: state.selectedFood!.copyWith(
              eatDate: event.eatDate,
              measurementUnitCount: event.measurementUnitCount,
              unitOfMeasurement: event.unitOfMeasurement,
            ),
          ),
        );
      }
    });
  }

  void _handleSearchedFoodsUpdated(
      SearchedFoodsUpdated event, Emitter<FoodSelectionState> emit) {
    emit(state.copyWith(foods: event.foods, status: FetchDataStatus.loaded));
  }

  Future<void> _handleFoodSelected(
      FoodSelected event, Emitter<FoodSelectionState> emit) async {
    List<UnitOfMeasurement> units = await _foodRepository.unitOfMeasurement;

    units.add(
      UnitOfMeasurement(
        title: "واحد متوسط",
        icon: Ionicons.ellipse_outline,
        howManyGrams: event.food.gramsPerUnit,
        max: _calculateMax(event.food.gramsPerUnit),
      ),
    );

    emit(
      state.copyWith(
        unitOfMesurementList: units,
        selectedFood: event.food.toSelectedFood(units.first),
      ),
    );
  }

  int? _calculateMax(int? gramsPerUnit) {
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
    emit(state.copyWith(query: event.query, status: FetchDataStatus.loading));
    try {
      await _foodRepository.searchFoods(event.query);
    } catch (e, s) {
      log('FoodSelectionBloc _handleSearchFood', error: e, stackTrace: s);
      emit(state.copyWith(query: event.query, status: FetchDataStatus.error));
    }
  }
}
