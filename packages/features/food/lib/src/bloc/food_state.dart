part of 'food_bloc.dart';

class FoodState {
  final ProcessAsyncStatus deleteFoodStatus;
  final List<FoodCM> foodsList;
  final ProcessAsyncStatus upsertFoodStatus;
  final FoodCM? updatedFood;

  FoodState({
    this.deleteFoodStatus = ProcessAsyncStatus.initial,
    this.upsertFoodStatus = ProcessAsyncStatus.initial,
    this.foodsList = const [],
    this.updatedFood,
  });

  FoodState copyWith(
      {ProcessAsyncStatus? deleteFoodStatus,
      ProcessAsyncStatus? upsertFoodStatus,
      List<FoodCM>? foodsList,
      FoodCM? updatedFood}) {
    return FoodState(
      deleteFoodStatus: deleteFoodStatus ?? this.deleteFoodStatus,
      upsertFoodStatus: upsertFoodStatus ?? this.upsertFoodStatus,
      foodsList: foodsList ?? this.foodsList,
      updatedFood: updatedFood ?? this.updatedFood,
    );
  }
}
