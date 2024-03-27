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
  }
  final FoodRepostiory foodRepostiory;

  void _registerHandlers() async {
    on<FoodEvent>((event, emit) async {
      if (event is ListenedFoodListStream) {
        await _handleListenedFoodListStream(event, emit);
      } else if (event is FoodUpdate) {
        await _handleFoodUpdate(event, emit);
      } else if (event is FoodDeleted) {
        await _handleFoodDeleted(event, emit);
      }
    });
  }

  Future<void> _handleListenedFoodListStream(
      ListenedFoodListStream event, Emitter<FoodState> emit) async {
    await emit.forEach(
      foodRepostiory.foodsStream,
      onData: (foodList) => state.copyWith(foodsList: foodList),
    );
  }

  Future<void> _handleFoodUpdate(
      FoodUpdate event, Emitter<FoodState> emit) async {
    await foodRepostiory.upsertFood(event.food);
    add(ListenedFoodListStream());
  }

  Future<void> _handleFoodDeleted(
      FoodDeleted event, Emitter<FoodState> emit) async {
    await foodRepostiory.removeFood(event.food);
    add(ListenedFoodListStream());
  }


}
