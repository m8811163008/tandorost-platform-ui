import 'dart:async';

import 'package:domain_model/domain_model.dart';

import 'package:food_repository/src/food_storage.dart';
import 'package:food_repository/src/mapper/cache_to_domain.dart';

class FoodRepostiory {
  final FoodStorage _foodStorage;

  FoodRepostiory(LocalStorage localStorage)
      : _foodStorage = FoodStorage(localStorage);

  // Stream controller of list of food provider stream.
  // The new listener does not need to get last cache emmited data.

  //Remember, it's important to always close your
  // StreamControllers when you're done with them to prevent memory leaks.

  Stream<List<FoodCM>> get foodsStream async* {
    yield* _foodStorage.getFoods();
  }

  Future<List<FoodCM>> searchFoods(String query) async {
    if (query.isEmpty) {
      //TODO:  use for return latest selection

      return const [];
    }
    final storageFoods = await _foodStorage.getFoods().first;

    final domainFoods = storageFoods
        .where(
            (foodCm) => foodCm.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return domainFoods;
  }

  Future<List<UnitOfMeasurement>> get unitOfMeasurement async {
    final unitsCM = await _foodStorage.units;
    return unitsCM.map((e) => e.toDomain()).toList();
  }

  Future<void> clearCollections() async {
    await _foodStorage.clearCollections();
  }

  Stream<List<SelectedFoodCM>> selectedFoodsListStream(
      {required DateTimeRange dateTimeRange}) async* {
    yield* _foodStorage.selectedFoodsList(
        start: dateTimeRange.start, end: dateTimeRange.end);
  }

  Future<void> upsertSelectedFood(SelectedFoodCM selectedFood) async {
    await _foodStorage.upsertSelectedFood(selectedFood);
  }

  Future<void> removeSelectedFood(SelectedFoodCM selectedFood) async {
    await _foodStorage.removeSelectedFood(selectedFood);
  }

  Future<void> upsertFood(FoodCM food) async {
    await _foodStorage.upsertFood(food);
  }

  Future<void> removeFood(FoodCM food) async {
    await _foodStorage.removeFood(food);
  }
}
