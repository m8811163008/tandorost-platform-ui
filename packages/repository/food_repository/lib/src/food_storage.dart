import 'dart:convert';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/json_to_cache.dart';
import 'package:local_storage/local_storage.dart';

class FoodStorage {
  final LocalStorage _localStorage;
  Set<UnitOfMeasurmentCM> unitOfMeasurementCache = const {};
  FoodStorage(this._localStorage);

  /// Initialize food collection.Create for every for a unique id.
  Future<void> initializeFood() async {
    final jsonFile = await _loadAsset('local_foods.json');

    final jsonFoodList = json.decode(jsonFile) as List;
    List<FoodCM> foodList = jsonFoodList
        .map((dynamic jsonFood) =>
            (jsonFood as Map<String, dynamic>).foodCMfromJson())
        .toList();
    final foodCollection = await _localStorage.foodCollection;
    return await _localStorage.writeTxn<FoodCM>(foodCollection, () async {
      await foodCollection.isar.foodCMs.putAll(foodList);
    });
  }

  /// get list of foods from the food collection. Read
  Future<List<FoodCM>> getFoods() async {
    final foodCollection = await _localStorage.foodCollection;
    late List<FoodCM> foodList;
    await _localStorage.txn<FoodCM>(foodCollection, () async {
      foodList = await foodCollection.where().findAll();
    });
    return foodList;
  }

  /// add a food to food collection. C
  Future<void> upsertFood(FoodCM foodCM) async {
    final foodCollection = await _localStorage.foodCollection;
    _localStorage.writeTxn<FoodCM>(foodCollection, () async {
      foodCollection.isar.foodCMs.put(foodCM);
    });

    return;
  }

  Future<String> _loadAsset(String fileName) async {
    //packages/food_repository/assets/local_foods.json
    return await rootBundle
        .loadString('packages/food_repository/assets/$fileName');
  }

  // /// Unit of measurement used for a food selection.
  Future<List<UserCM>> get user async {
    final userCollection = await _localStorage.userCollection;
    // _localStorage.txn<>(userCollection, () => userCollection.get(0));

    return await userCollection.where().findAll();
  }

  Future<Set<UnitOfMeasurmentCM>> get units async {
    if (unitOfMeasurementCache.isNotEmpty) return unitOfMeasurementCache;

    final jsonFile = await _loadAsset('local_unit_of_measurement.json');
    final jsonList = json.decode(jsonFile) as List;
    unitOfMeasurementCache = jsonList
        .map((dynamic jsonElement) => (jsonElement as Map<String, dynamic>)
            .unitOfMeasurmentCMFromJson() as UnitOfMeasurmentCM)
        .toSet();
    return unitOfMeasurementCache;
  }

  Future<void> clearCollections() async {
    await _localStorage.persistIsarDBInstance?.clear();
    await _localStorage.temporaryIsarDBInstance?.clear();
    log('Cleared database collection');
  }

  Future<void> upsertSelectedFood(SelectedFoodCM selectedFoodCM) async {
    final userCollection = await _localStorage.userCollection;
    await _localStorage.writeTxn<UserCM>(userCollection, () async {
      final user = await userCollection.get(0);
      if (!user!.selectedFoods.contains(selectedFoodCM)) {
        user.selectedFoods.add(selectedFoodCM);
      } else {
        user.selectedFoods.singleWhere((element) => element == selectedFoodCM)
          ..calorie = selectedFoodCM.calorie
          ..gramsPerUnit = selectedFoodCM.gramsPerUnit
          ..numberOfUnits = selectedFoodCM.numberOfUnits
          ..unitOfMeasurment = selectedFoodCM.unitOfMeasurment
          ..macroNutrition = selectedFoodCM.macroNutrition;
      }
    });
  }
}
