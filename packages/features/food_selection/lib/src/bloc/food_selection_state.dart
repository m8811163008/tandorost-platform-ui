part of 'food_selection_bloc.dart';

class FoodSelectionState {
  final String query;
  final List<Food> foods;
  final FetchDataStatus status;

  const FoodSelectionState({
    this.query = '',
    this.foods = const [],
    this.status = FetchDataStatus.initial,
  });

  FoodSelectionState copyWith({
    String? query,
    List<Food>? foods,
    FetchDataStatus? status,
  }) {
    return FoodSelectionState(
      query: query ?? this.query,
      foods: foods ?? this.foods,
      status: status ?? this.status,
    );
  }
}
