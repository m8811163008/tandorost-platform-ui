import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/cache_to_domain.dart';
import 'package:food_repository/src/food_storage.dart';
import 'package:local_storage/local_storage.dart';

class FoodRepostiory {
  final FoodStorage _foodStorage;

  FoodRepostiory(LocalStorage localStorage)
      : _foodStorage = FoodStorage(localStorage);

  final StreamController<List<Food>> _foodsController =
      StreamController<List<Food>>.broadcast();

  Stream<List<Food>> get searchedFoodsStream async* {
    yield* _foodsController.stream;
  }

  Future<void> searchFoods(String query) async {
    if (query.isEmpty) {
      //todo:  use for return latest selection
      _foodsController.add([]);
      return;
    }
    var storageFoods = await _foodStorage.getFoods();
    if (storageFoods.isEmpty) {
      await _foodStorage.initializeFood();
      storageFoods = await _foodStorage.getFoods();
    }

    final domainFoods = storageFoods
        .where((foodCm) =>
            foodCm.foodDataCM.name.toLowerCase().contains(query.toLowerCase()))
        .map((foodCm) => foodCm.toDomain())
        .toList();
    _foodsController.add(domainFoods);
  }
}
