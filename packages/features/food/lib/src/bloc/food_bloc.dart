import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(this.foodRepostiory) : super(FoodState()) {
    _registerHandlers();
    add(ListenedFoodListStream());
    _handleNewFoodName();
  }
  final FoodRepostiory foodRepostiory;

  void _registerHandlers() async {
    on<FoodEvent>((event, emit) async {
      if (event is ListenedFoodListStream) {
        await _handleListenedFoodListStream(event, emit);
      } else if (event is FoodUpserted) {
        await _handleFoodUpserted(event, emit);
      } else if (event is FoodDeleted) {
        await _handleFoodDeleted(event, emit);
      } else if (event is _GetFoodNameFromFoodSelectionRoute) {
        _handleGetFoodNameFromFoodSelectionRoute(event, emit);
      }
    });
  }

  void _handleNewFoodName() async {
    final foodName =
        await foodRepostiory.foodRepostioryState.newFoodNameStream.single;
    add(_GetFoodNameFromFoodSelectionRoute(foodName: foodName));
  }

  Future<void> _handleListenedFoodListStream(
      ListenedFoodListStream event, Emitter<FoodState> emit) async {
    await emit.forEach(
      foodRepostiory.foodsStream,
      onData: (foodList) {
        foodList.sort((a, b) => b.name.compareTo(a.name));
        return state.copyWith(foodsList: foodList);
      },
    );
  }

  Future<void> _handleFoodUpserted(
      FoodUpserted event, Emitter<FoodState> emit) async {
    await foodRepostiory.upsertFood(event.food);
    add(ListenedFoodListStream());
  }

  Future<void> _handleFoodDeleted(
      FoodDeleted event, Emitter<FoodState> emit) async {
    await foodRepostiory.removeFood(event.food);
    add(ListenedFoodListStream());
  }

  void _handleGetFoodNameFromFoodSelectionRoute(
      _GetFoodNameFromFoodSelectionRoute event, Emitter<FoodState> emit) async {
    emit(
      state.copyWith(
        newFoodNameFromFoodSelection: event.foodName,
      ),
    );
  }
}
