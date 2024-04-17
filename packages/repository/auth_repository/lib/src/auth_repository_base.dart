import 'dart:async';

import 'package:auth_repository/src/auth_storage.dart';
import 'package:domain_model/domain_model.dart';

class FoodRepostiory {
  final AuthStorage _foodStorage;

  FoodRepostiory(LocalStorage localStorage)
      : _foodStorage = AuthStorage(localStorage);

  Future<void> removeFood(FoodCM food) async {
    await _foodStorage.removeFood(food);
  }
}
