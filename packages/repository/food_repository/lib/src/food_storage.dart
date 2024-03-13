import 'dart:convert';
import 'dart:io';

import 'package:local_storage/local_storage.dart';
import 'package:flutter/services.dart' show rootBundle;

class FoodStorage {
  final LocalStorage _localStorage;
  FoodStorage(this._localStorage);

  Future<void> initializeFood() async {
    final jsonFile = await loadAsset();
    final jsonFoodList = json.decode(jsonFile) as List;
    List<FoodCM> foodList = jsonFoodList
        .map((jsonFood) => FoodCM.fromJson(jsonFood as Map<String, dynamic>))
        .toList();
    await _localStorage.writeTxn<FoodCM>((isarCollection) async {
      await isarCollection.putAll(foodList);
    });
  }

  Future<String> loadAsset() async {
    //packages/food_repository/assets/local_foods.json
    return await rootBundle
        .loadString('packages/food_repository/assets/local_foods.json');
  }

  Future<List<FoodCM>> getFoods() async {
    final foodCollection = await _localStorage.foodCollection;

    return await foodCollection.where().findAll();
  }

  Future<void> addFood(FoodCM foodCM) async {
    _localStorage.writeTxn<FoodCM>((isarCollection) async {
      await isarCollection.put(foodCM);
    });

    return;
  }
}
