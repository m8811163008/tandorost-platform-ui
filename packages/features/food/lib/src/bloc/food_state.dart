part of 'food_bloc.dart';

class FoodState {
  final ProcessAsyncStatus deleteFoodStatus;
  final List<Food> foodsList;
  final ProcessAsyncStatus upsertFoodStatus;
  final Food? updatedFood;

  FoodState({
    this.deleteFoodStatus = ProcessAsyncStatus.initial,
    this.upsertFoodStatus = ProcessAsyncStatus.initial,
    this.foodsList = const [],
    this.updatedFood,
  });

  FoodState copyWith(
      {ProcessAsyncStatus? deleteFoodStatus,
      ProcessAsyncStatus? upsertFoodStatus,
      List<Food>? foodsList,
      Food? updatedFood}) {
    return FoodState(
      deleteFoodStatus: deleteFoodStatus ?? this.deleteFoodStatus,
      upsertFoodStatus: upsertFoodStatus ?? this.upsertFoodStatus,
      foodsList: foodsList ?? this.foodsList,
      updatedFood: updatedFood ?? this.updatedFood,
    );
  }
}
