import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/cache_to_domain.dart';
import 'package:food_repository/mapper/domain_to_cache.dart';
import 'package:food_repository/src/food_storage.dart';
import 'package:local_storage/local_storage.dart';

class FoodRepostiory {
  final FoodStorage _foodStorage;

  FoodRepostiory(LocalStorage localStorage)
      : _foodStorage = FoodStorage(localStorage);

  // Stream controller of list of food provider stream.
  // The new listener does not need to get last cache emmited data.
  final StreamController<List<Food>> _foodsController =
      StreamController<List<Food>>.broadcast();

  // Emits the List<Food> searched by `searchFoods` method.
  Stream<List<Food>> get searchedFoodsStream async* {
    yield* _foodsController.stream;
  }

  Stream<List<Food>> get foodsStream async* {
    yield* _foodStorage.getFoods().map(
        (listFoodCM) => listFoodCM.map((foodCm) => foodCm.toDomain()).toList());
  }

  Future<void> searchFoods(String query) async {
    if (query.isEmpty) {
      //TODO:  use for return latest selection
      _foodsController.add([]);
      return;
    }
    final storageFoods = await _foodStorage.getFoods().first;

    final domainFoods = storageFoods
        .where(
            (foodCm) => foodCm.name.toLowerCase().contains(query.toLowerCase()))
        .map((foodCm) => foodCm.toDomain())
        .toList();
    _foodsController.add(domainFoods);
    // var storageFoods = await _foodStorage.getFoods().first;
  }

  Future<List<UnitOfMeasurement>> get unitOfMeasurement async {
    final unitsCM = await _foodStorage.units;
    return unitsCM.map((e) => e.toDomain()).toList();
  }

  Future<void> clearCollections() async {
    await _foodStorage.clearCollections();
  }

  Stream<List<SelectedFood>> selectedFoodsListStream(
      {required DateTimeRange dateTimeRange}) async* {
    final foodStream = _foodStorage.selectedFoodsList(
        start: dateTimeRange.start, end: dateTimeRange.end);
    yield* foodStream.map(
      (event) => event.map((e) => e.toDomain()).toList(),
    );
  }

  Future<void> upsertSelectedFood(SelectedFood selectedFood) async {
    final selectedFoodCM = selectedFood.toCacheModel();
    await _foodStorage.upsertSelectedFood(selectedFoodCM);
  }

  Future<void> removeSelectedFood(SelectedFood selectedFood) async {
    final selectedFoodCM = selectedFood.toCacheModel();
    await _foodStorage.removeSelectedFood(selectedFoodCM);
  }

  Future<void> upsertFood(Food food) async {
    final foodCM = food.toCacheModel();
    await _foodStorage.upsertFood(foodCM);
  }

  Future<void> removeFood(Food food) async {
    final foodCM = food.toCacheModel();
    await _foodStorage.removeFood(foodCM);
  }
}
