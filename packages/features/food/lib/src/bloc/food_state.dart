part of 'food_bloc.dart';

class FoodState {
  final FetchDataStatus deleteFoodStatus;
  final List<Food> foodsList;
  final FetchDataStatus upsertFoodStatus;
  final Food? updatedFood;

  FoodState({
    this.deleteFoodStatus = FetchDataStatus.initial,
    this.upsertFoodStatus = FetchDataStatus.initial,
    this.foodsList = const [],
    this.updatedFood,
  });

  FoodState copyWith(
      {FetchDataStatus? deleteFoodStatus,
      FetchDataStatus? upsertFoodStatus,
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
