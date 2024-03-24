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
  late final StreamSubscription<List<Food>> _foodsListSubscription;

  void _registerHandlers() async {
    on<FoodEvent>((event, emit) async {
      if (event is ListenedFoodListStream) {
        await _handleListenedFoodListStream(event, emit);
      } else if (event is FoodUpdate) {
        _handleFoodUpdate(event, emit);
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
    print(event.food);
    emit(state.copyWith(updatedFood: event.food));
  }

  @override
  Future<void> close() {
    _foodsListSubscription.cancel();
    return super.close();
  }
}
