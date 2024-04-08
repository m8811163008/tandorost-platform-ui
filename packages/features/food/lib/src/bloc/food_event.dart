part of 'food_bloc.dart';

sealed class FoodEvent {}

final class FoodUndoRemoved extends FoodEvent {}

final class ListenedFoodListStream extends FoodEvent {}

sealed class FoodUpsertedScreen extends FoodEvent {}

final class FoodUpdate extends FoodUpsertedScreen {
  final FoodCM food;
  FoodUpdate({required this.food});
}

final class FoodDeleted extends FoodUpsertedScreen {
  final FoodCM food;
  FoodDeleted({required this.food});
}
