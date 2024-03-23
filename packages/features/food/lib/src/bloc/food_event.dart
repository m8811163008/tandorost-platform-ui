part of 'food_bloc.dart';

sealed class FoodEvent {}

final class FoodUndoRemoved extends FoodEvent {}

final class ListenedFoodListStream extends FoodEvent {}
