part of 'food_bloc.dart';

class FoodState {
  final ProcessAsyncStatus deleteFoodStatus;
  final List<FoodCM> foodsList;
  final ProcessAsyncStatus upsertFoodStatus;
  final FoodCM? updatedFood;
  final String newFoodNameFromFoodSelection;
  final String selctedFoodsListSearchTerm;

  FoodState({
    this.deleteFoodStatus = ProcessAsyncStatus.initial,
    this.upsertFoodStatus = ProcessAsyncStatus.initial,
    this.foodsList = const [],
    this.updatedFood,
    this.newFoodNameFromFoodSelection = '',
    this.selctedFoodsListSearchTerm = '',
  });

  FoodState copyWith({
    ProcessAsyncStatus? deleteFoodStatus,
    ProcessAsyncStatus? upsertFoodStatus,
    List<FoodCM>? foodsList,
    FoodCM? updatedFood,
    String? newFoodNameFromFoodSelection,
    String? selctedFoodsListSearchTerm,
  }) {
    return FoodState(
      deleteFoodStatus: deleteFoodStatus ?? this.deleteFoodStatus,
      upsertFoodStatus: upsertFoodStatus ?? this.upsertFoodStatus,
      foodsList: foodsList ?? this.foodsList,
      updatedFood: updatedFood ?? this.updatedFood,
      selctedFoodsListSearchTerm:
          selctedFoodsListSearchTerm ?? this.selctedFoodsListSearchTerm,
      newFoodNameFromFoodSelection:
          newFoodNameFromFoodSelection ?? this.newFoodNameFromFoodSelection,
    );
  }
}
