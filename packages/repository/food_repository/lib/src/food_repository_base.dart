import 'dart:async';

import 'package:cache_storage/cache_storage.dart';
import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/cache_to_domain.dart';
import 'package:food_repository/src/food_storage.dart';

class FoodRepostiory {
  final FoodStorage _foodStorage;

  FoodRepostiory(CacheStorage cacheStorage)
      : _foodStorage = FoodStorage(cacheStorage);

  final StreamController<List<Food>> _foodsController =
      StreamController<List<Food>>.broadcast()..add(const []);

  Stream<List<Food>> get foodsStream async* {
    var storageFoods = await _foodStorage.getFoods();
    if (storageFoods.isEmpty) {
      await _foodStorage.initializeFood();
    }
    storageFoods = await _foodStorage.getFoods();
    final domainFoods =
        storageFoods.map((foodCm) => foodCm.toDomain()).toList();
    _foodsController.add(domainFoods);
    yield* _foodsController.stream;
  }
}
