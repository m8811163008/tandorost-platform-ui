part of 'food_bloc.dart';

sealed class FoodEvent {}

final class FoodUndoRemoved extends FoodEvent {}

final class ListenedFoodListStream extends FoodEvent {}

sealed class FoodUpsertedScreen extends FoodEvent {}

final class FoodUpserted extends FoodUpsertedScreen {
  final FoodCM food;
  FoodUpserted({required this.food});
}

final class FoodDeleted extends FoodUpsertedScreen {
  final FoodCM food;
  FoodDeleted({required this.food});
}

final class _GetFoodNameFromFoodSelectionRoute extends FoodEvent {
  final String foodName;
  _GetFoodNameFromFoodSelectionRoute({required this.foodName});
}
