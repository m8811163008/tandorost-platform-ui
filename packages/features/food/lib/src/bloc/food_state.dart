part of 'food_bloc.dart';

class FoodState {
  final FetchDataStatus deleteFoodStatus;
  final List<Food> foodsList;

  FoodState({
    this.deleteFoodStatus = FetchDataStatus.initial,
    this.foodsList = const [],
  });

  FoodState copyWith({
    FetchDataStatus? deleteFoodStatus,
    List<Food>? foodsList,
  }) {
    return FoodState(
      deleteFoodStatus: deleteFoodStatus ?? this.deleteFoodStatus,
      foodsList: foodsList ?? this.foodsList,
    );
  }
}
