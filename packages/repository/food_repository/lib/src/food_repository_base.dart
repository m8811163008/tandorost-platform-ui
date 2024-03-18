import 'dart:async';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/cache_to_domain.dart';
import 'package:food_repository/src/food_storage.dart';
import 'package:local_storage/local_storage.dart';

class FoodRepostiory {
  final FoodStorage _foodStorage;

  FoodRepostiory(LocalStorage localStorage)
      : _foodStorage = FoodStorage(localStorage) {
    _initialize();
  }

  void _initialize() async {
    var storageFoods = await _foodStorage.getFoods();
    if (storageFoods.isEmpty) {
      try {
        await _foodStorage.initializeFood();
      } catch (e, s) {
        log('FoodRepostiory._initialize', error: e, stackTrace: s);
      }
    }
  }

  final StreamController<List<Food>> _foodsController =
      StreamController<List<Food>>.broadcast();

  Stream<List<Food>> get searchedFoodsStream async* {
    yield* _foodsController.stream;
  }

  Future<void> searchFoods(String query) async {
    if (query.isEmpty) {
      //TODO:  use for return latest selection
      _foodsController.add([]);
      return;
    }
    var storageFoods = await _foodStorage.getFoods();

    final domainFoods = storageFoods
        .where(
            (foodCm) => foodCm.name.toLowerCase().contains(query.toLowerCase()))
        .map((foodCm) => foodCm.toDomain())
        .toList();
    _foodsController.add(domainFoods);
  }

  Future<List<UnitOfMeasurement>> get unitOfMeasurement async {
    final unitsCM = await _foodStorage.units;
    return unitsCM.map((e) => e.toDomain()).toList();
  }

  Future<void> clearCollections() async {
    await _foodStorage.clearCollections();
  }
}
