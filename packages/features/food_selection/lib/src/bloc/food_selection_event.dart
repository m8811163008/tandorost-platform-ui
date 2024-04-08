part of 'food_selection_bloc.dart';

sealed class FoodSelectionEvent {
  const FoodSelectionEvent();
}

final class SearchFood extends FoodSelectionEvent {
  final String query;
  SearchFood(this.query);
}

final class SearchedFoodsUpdated extends FoodSelectionEvent {
  final List<FoodCM> foods;
  SearchedFoodsUpdated(this.foods);
}

final class FetchedUnitOfMeasurement extends FoodSelectionEvent {
  FetchedUnitOfMeasurement();
}

final class FoodSelected extends FoodSelectionEvent {
  final FoodCM food;
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
  final List<SelectedFoodCM> selectedFoods;
  const SelectedFoodsListFetched({this.selectedFoods = const []});
}

final class SearchFoodFormReset extends InputPageEvent {
  const SearchFoodFormReset();
}

/// Used to save unit of measurement amount in state.
final class UnitOfMeasurementAmountChanged extends InputPageEvent {
  final UnitOfMeasurement unitOfMeasurement;
  final int amount;
  const UnitOfMeasurementAmountChanged(
      {required this.amount, required this.unitOfMeasurement});
}

base class SlectedFoodListPageEvent extends FoodSelectionEvent {
  const SlectedFoodListPageEvent();
}

final class SlectedFoodListFiltered extends SlectedFoodListPageEvent {
  final DateTimeRange dateTimeRange;
  const SlectedFoodListFiltered({required this.dateTimeRange});
}

final class SelectedFoodRemoved extends SlectedFoodListPageEvent {
  final SelectedFoodCM food;
  const SelectedFoodRemoved({required this.food});
}

final class SelectedFoodUndoRemoved extends SlectedFoodListPageEvent {
  const SelectedFoodUndoRemoved();
}

abstract base class CreatedNewFoodEvent extends SlectedFoodListPageEvent {
  const CreatedNewFoodEvent();
}

/// Used when the user hold for long tap or onTap of list tile.
///
///
final class FoodSelectedForNewFood extends CreatedNewFoodEvent {
  final SelectedFoodCM selectedFood;
  const FoodSelectedForNewFood({required this.selectedFood});
}

final class NewFoodNameUpdated extends CreatedNewFoodEvent {
  final String value;
  const NewFoodNameUpdated({required this.value});
}

final class NewFoodFromSelectedFoodsCreated extends CreatedNewFoodEvent {
  const NewFoodFromSelectedFoodsCreated();
}
