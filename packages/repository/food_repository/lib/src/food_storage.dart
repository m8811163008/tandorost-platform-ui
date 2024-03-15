import 'dart:convert';

import 'package:food_repository/mapper/json_to_cache.dart';
import 'package:local_storage/local_storage.dart';
import 'package:flutter/services.dart' show rootBundle;

class FoodStorage {
  final LocalStorage _localStorage;
  FoodStorage(this._localStorage);

  Future<void> initializeFood() async {
    final jsonFile = await _loadAsset('local_foods.json');
    final jsonFoodList = json.decode(jsonFile) as List;
    List<FoodCM> foodList = jsonFoodList
        .map((jsonFood) =>
            jsonFood.foodCMfromJson(jsonFood as Map<String, dynamic>) as FoodCM)
        .toList();
    await _localStorage.writeTxn<FoodCM>((isarCollection) async {
      await isarCollection.putAll(foodList);
    });
  }

  Future<void> initializeUnitOfMeasurement() async {
    final jsonFile = await _loadAsset('local_unit_of_measurement.json');
    final jsonList = json.decode(jsonFile) as List<Map<String, dynamic>>;
    List<UnitOfMeasurmentCM> objectList = jsonList
        .map((jsonElement) =>
            jsonElement.unitOfMeasurmentCMFromJson(jsonElement))
        .toList();
    await _localStorage.writeTxn<UnitOfMeasurmentCM>((isarCollection) async {
      await isarCollection.putAll(objectList);
    });
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

  Future<String> _loadAsset(String fileName) async {
    //packages/food_repository/assets/local_foods.json
    return await rootBundle
        .loadString('packages/food_repository/assets/$fileName');
  }

  Future<List<UnitOfMeasurmentCM>> get units async {
    final uomCollection = await _localStorage.unitOfMeasurmentCollection;

    return await uomCollection.where().findAll();
  }
}
