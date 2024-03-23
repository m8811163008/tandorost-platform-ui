part of 'food_selection_bloc.dart';

sealed class FoodSelectionEvent {
  const FoodSelectionEvent();
}

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

base class InputPageEvent extends FoodSelectionEvent {
  const InputPageEvent();
}

final class SelectedFoodUpdated extends InputPageEvent {
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
  const SelectedFoodSaved();
}

final class SelectedFoodsListFetched extends InputPageEvent {
  final List<SelectedFood> selectedFoods;
  const SelectedFoodsListFetched({this.selectedFoods = const []});
}

final class SearchFoodFormReset extends InputPageEvent {
  const SearchFoodFormReset();
}

base class SlectedFoodListPageEvent extends FoodSelectionEvent {
  const SlectedFoodListPageEvent();
}

final class SlectedFoodListFiltered extends SlectedFoodListPageEvent {
  final DateTimeRange dateTimeRange;
  const SlectedFoodListFiltered({required this.dateTimeRange});
}

final class SelectedFoodRemoved extends SlectedFoodListPageEvent {
  final SelectedFood food;
  const SelectedFoodRemoved({required this.food});
}

final class SelectedFoodUndoRemoved extends SlectedFoodListPageEvent {
  const SelectedFoodUndoRemoved();
}
