part of 'food_selection_bloc.dart';

sealed class FoodSelectionEvent {}

final class SearchFood extends FoodSelectionEvent {
  final String query;
  SearchFood(this.query);
}

final class SearchedFoodsUpdated extends FoodSelectionEvent {
  final List<Food> foods;
  SearchedFoodsUpdated(this.foods);
}

final class FetchedUnitOfMeasurement extends FoodSelectionEvent {
  FetchedUnitOfMeasurement();
}

final class FoodSelected extends FoodSelectionEvent {
  final Food food;
  FoodSelected(this.food);
}

base class InputPageEvent extends FoodSelectionEvent {}

final class SelectedFoodUpdated extends InputPageEvent {
  /// Utc time
  final Duration? saveEatDateTimeOffset;

  /// shows number of units of measurement selected
  final int? measurementUnitCount;
  final UnitOfMeasurement? unitOfMeasurement;
  SelectedFoodUpdated({
    this.measurementUnitCount,
    this.unitOfMeasurement,
    this.saveEatDateTimeOffset,
  });
}

final class SelectedFoodSaved extends InputPageEvent {
  SelectedFoodSaved();
}

final class SelectedFoodsListFetched extends InputPageEvent {
  final List<SelectedFood> selectedFoods;
  SelectedFoodsListFetched({this.selectedFoods = const []});
}

final class SearchFoodFormReset extends InputPageEvent {
  SearchFoodFormReset();
}
