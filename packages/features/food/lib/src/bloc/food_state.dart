part of 'food_bloc.dart';

class FoodState {
  final ProcessAsyncStatus deleteFoodStatus;
  final List<FoodCM> foodsList;
  final ProcessAsyncStatus upsertFoodStatus;
  final FoodCM? updatedFood;
  final String newFoodNameFromFoodSelection;

  FoodState({
    this.deleteFoodStatus = ProcessAsyncStatus.initial,
    this.upsertFoodStatus = ProcessAsyncStatus.initial,
    this.foodsList = const [],
    this.updatedFood,
    this.newFoodNameFromFoodSelection = '',
  });

  FoodState copyWith({
    ProcessAsyncStatus? deleteFoodStatus,
    ProcessAsyncStatus? upsertFoodStatus,
    List<FoodCM>? foodsList,
    FoodCM? updatedFood,
    String? newFoodNameFromFoodSelection,
  }) {
    return FoodState(
      deleteFoodStatus: deleteFoodStatus ?? this.deleteFoodStatus,
      upsertFoodStatus: upsertFoodStatus ?? this.upsertFoodStatus,
      foodsList: foodsList ?? this.foodsList,
      updatedFood: updatedFood ?? this.updatedFood,
      newFoodNameFromFoodSelection:
          newFoodNameFromFoodSelection ?? this.newFoodNameFromFoodSelection,
    );
  }
}
