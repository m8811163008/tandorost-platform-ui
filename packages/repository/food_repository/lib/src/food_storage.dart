import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/src/mapper/json_to_cache.dart';

class FoodStorage {
  final LocalStorage _localStorage;
  Set<UnitOfMeasurmentCM> unitOfMeasurementCache = const {};
  FoodStorage(this._localStorage) {
    initialize();
  }

  Future<void> initialize() async {
    // await clearCollections();
    //TODO initialize boxes in data layer adn expose method for client, prevent to reinitialize when
    await Future.wait([
      initializeFood(),
      initializeUnitOfMeasurement(),
    ]);
  }

  /// Initialize food collection.Create for every for a unique id.
  Future<void> initializeFood() async {
    final foodCollection = await _localStorage.foodBox;

    final count = foodCollection.length;
    if (count != 0) return;
    final jsonFile = await _loadAsset('local_foods.json');

    final jsonFoodList = json.decode(jsonFile) as List;
    List<FoodCM> foodList = jsonFoodList
        .map((dynamic jsonFood) =>
            (jsonFood as Map<String, dynamic>).foodCMfromJson())
        .toList();
    final foodListMapEntry = foodList.map((e) => MapEntry(e.name, e)).toList();
    final foodMap = Map.fromEntries(foodListMapEntry);

    await foodCollection.putAll(foodMap);
  }

  Future<void> initializeUnitOfMeasurement() async {
    final unitsOfMeasurementCollection =
        await _localStorage.unitsOfMeasurementCollection;

    final count = unitsOfMeasurementCollection.length;
    if (count != 0) return;
    final jsonFile = await _loadAsset('local_unit_of_measurement.json');

    final jsonFoodList = json.decode(jsonFile) as List;
    List<UnitOfMeasurmentCM> unitOfMeasurmentList = jsonFoodList
        .map((dynamic jsonFood) =>
            (jsonFood as Map<String, dynamic>).unitOfMeasurmentCMFromJson())
        .toList();

    unitsOfMeasurementCollection.addAll(unitOfMeasurmentList);
  }

  /// get list of foods from the food collection. Read

  Future<String> _loadAsset(String fileName) async {
    //packages/food_repository/assets/local_foods.json
    return await rootBundle
        .loadString('packages/food_repository/assets/$fileName');
  }

  Future<Set<UnitOfMeasurmentCM>> get units async {
    final unitsOfMeasurementCollection =
        await _localStorage.unitsOfMeasurementCollection;

    return unitsOfMeasurementCollection.values.toSet();
  }

  Future<void> clearCollections() async {
    final foodCollection = await _localStorage.foodBox;
    await foodCollection.clear();
    final unitsOfMeasurementCollection =
        await _localStorage.unitsOfMeasurementCollection;
    await unitsOfMeasurementCollection.clear();
    final selectedFoodBox = await _localStorage.selectedFoodBox;
    await selectedFoodBox.clear();

    log('Cleared foodBox and unitsOfMeasurementBox');
    await initialize();
    log('Initialized foodBox and unitOfmeasurementBox');
  }

  Stream<List<SelectedFoodCM>> filterSelectedFoodsListStream(
      {required DateTime start, required DateTime end}) async* {
    final selectedFoodBox = await _localStorage.selectedFoodBox;
    yield selectedFoodBox.values
        .where((element) =>
            element.selectedDate.isAfter(start) &&
            element.selectedDate.isBefore(end))
        .toList();
    yield* selectedFoodBox.watch().asyncMap((event) async {
      final selectedFoodBox = await _localStorage.selectedFoodBox;
      return selectedFoodBox.values
          .where((element) =>
              element.selectedDate.isAfter(start) &&
              element.selectedDate.isBefore(end))
          .toList();
    });
  }

  Future<void> upsertSelectedFood(SelectedFoodCM selectedFoodCM) async {
    final selectedFoodBox = await _localStorage.selectedFoodBox;
    await selectedFoodBox.add(selectedFoodCM);
  }

  Future<void> removeSelectedFood(SelectedFoodCM selectedFoodCM) async {
    final selectedFoodBox = await _localStorage.selectedFoodBox;
    final key = selectedFoodBox
        .toMap()
        .entries
        .singleWhere((element) => element.value == selectedFoodCM)
        .key;

    await selectedFoodBox.delete(key);
  }

  Future<void> removeFood(FoodCM food) async {
    final foodBox = await _localStorage.foodBox;
    await foodBox.delete(food.name);
  }

  Stream<List<FoodCM>> getFoods() async* {
    final foodBox = await _localStorage.foodBox;
    yield foodBox.values.toList();
    yield* foodBox.watch().map((event) => foodBox.values.toList());
  }

  /// add a food to food collection.
  Future<void> upsertFood(FoodCM foodCM) async {
    final foodBox = await _localStorage.foodBox;
    await foodBox.put(foodCM.name, foodCM);
  }
}
