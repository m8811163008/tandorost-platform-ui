import 'dart:convert';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/json_to_cache.dart';
import 'package:local_storage/local_storage.dart';

class FoodStorage {
  final LocalStorage _localStorage;
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
    await _localStorage.writeTxn<FoodCM>(foodCollection, () async {
      foodCollection.isar.foodCMs.putAll(foodList);
    });
  }

  Future<void> initializeUnitOfMeasurement() async {
    // final jsonFile = await _loadAsset('local_unit_of_measurement.json');
    // final jsonList = json.decode(jsonFile) as List;
    // List<UnitOfMeasurmentCM> objectList = jsonList
    //     .map((dynamic jsonElement) => (jsonElement as Map<String, dynamic>)
    //         .unitOfMeasurmentCMFromJson() as UnitOfMeasurmentCM)
    //     .toList();
    final userCollection = await _localStorage.userCollection;
    await _localStorage.writeTxn<UserCM>(userCollection, () async {
      // userCollection.isar.collection<UserCM>().put();
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
}
