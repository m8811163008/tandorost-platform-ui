import 'dart:convert';
import 'dart:io';

import 'package:local_storage/local_storage.dart';
import 'package:flutter/services.dart' show rootBundle;

class FoodStorage {
  final LocalStorage _localStorage;
  FoodStorage(this._localStorage);

  Future<void> initializeFood() async {
    final jsonFile = await _loadFoodAsset();
    final jsonFoodList = json.decode(jsonFile) as List;
    List<FoodCM> foodList = jsonFoodList
        .map((jsonFood) =>
            jsonFood.foodCMfromJson(jsonFood as Map<String, dynamic>) as FoodCM)
        .toList();
    await _localStorage.writeTxn<FoodCM>((isarCollection) async {
      await isarCollection.putAll(foodList);
    });
  }

  Future<String> _loadFoodAsset() async {
    //packages/food_repository/assets/local_foods.json
    return await rootBundle
        .loadString('packages/food_repository/assets/local_foods.json');
  }

  Future<void> initializeUnitOfMeasurement() async {
    final jsonFile = await _loadUnitOfMesarmentAsset();
    final jsonList = json.decode(jsonFile) as List;
    List<UnitOfMeasurmentCM> objectList = jsonList
        .map((jsonElement) => jsonElement.unitOfMeasurmentCMFromJson(
            jsonElement as Map<String, dynamic>) as UnitOfMeasurmentCM)
        .toList();
    await _localStorage.writeTxn<UnitOfMeasurmentCM>((isarCollection) async {
      await isarCollection.putAll(objectList);
    });
  }

  Future<String> _loadUnitOfMesarmentAsset() async {
    //packages/food_repository/assets/local_unit_of_measurement.json
    return await rootBundle.loadString(
        'packages/food_repository/assets/local_unit_of_measurement.json');
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
