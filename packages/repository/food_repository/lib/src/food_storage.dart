import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:domain_model/domain_model.dart';
import 'package:food_repository/mapper/json_to_cache.dart';
import 'package:local_storage/local_storage.dart';
import 'package:rxdart/rxdart.dart';

class FoodStorage {
  final LocalStorage _localStorage;
  Set<UnitOfMeasurmentCM> unitOfMeasurementCache = const {};
  FoodStorage(this._localStorage) {
    _initialize();
  }

  void _initialize() async {
    // await clearCollections();
    // await Future.wait([
    //   initializeFood(),
    //   initializeUser(),
    // ]);
  }

  /// Initialize food collection.Create for every for a unique id.
  Future<void> initializeFood() async {
    final foodCollection = await _localStorage.foodCollection;

    final count = await foodCollection.count();
    if (count != 0) return;
    final jsonFile = await _loadAsset('local_foods.json');

    final jsonFoodList = json.decode(jsonFile) as List;
    List<FoodCM> foodList = jsonFoodList
        .map((dynamic jsonFood) =>
            (jsonFood as Map<String, dynamic>).foodCMfromJson())
        .toList();

    await foodCollection.isar.writeTxn(() async {
      await foodCollection.isar.foodCMs.putAll(foodList);
    });
  }

  Future<void> initializeUser() async {
    final userCollection = await _localStorage.userCollection;
    final count = await userCollection.count();
    if (count != 0) return;
    final user = UserCM()..selectedFoods = const [];

    return await userCollection.isar
        .writeTxn(() async => userCollection.put(user));
  }

  /// get list of foods from the food collection. Read
  Stream<List<FoodCM>> getFoods() async* {
    final foodCollection = await _localStorage.foodCollection;
    yield* await foodCollection.isar.txn<Stream<List<FoodCM>>>(() async {
      return foodCollection
          .watchLazy(fireImmediately: true)
          .asBroadcastStream()
          .mapTo(await foodCollection.where().findAll());
    });
  }

  /// add a food to food collection. C
  Future<void> upsertFood(FoodCM foodCM) async {
    final foodCollection = await _localStorage.foodCollection;
    await foodCollection.isar.writeTxn(() async {
      // TODO find efficient way
      final foods = await foodCollection.where().findAll();
      FoodCM upsertSubjectFood = foods.singleWhere(
        (element) => element.name == foodCM.name,
        orElse: () => foodCM,
      );
      upsertSubjectFood = upsertSubjectFood.copyWith(
        calorie: foodCM.calorie,
        name: foodCM.name,
        gramsPerUnit: foodCM.gramsPerUnit,
        macroNutrition: foodCM.macroNutrition.copyWith(
          carbohydrate: foodCM.macroNutrition.carbohydrate,
          fat: foodCM.macroNutrition.fat,
          protein: foodCM.macroNutrition.protein,
        ),
      );
      await foodCollection.isar.foodCMs.put(upsertSubjectFood);
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
        .map((dynamic jsonElement) =>
            (jsonElement as Map<String, dynamic>).unitOfMeasurmentCMFromJson())
        .toSet();
    return unitOfMeasurementCache;
  }

  Future<void> clearCollections() async {
    final foodCollection = await _localStorage.foodCollection;
    await foodCollection.isar.writeTxn(() => foodCollection.clear());
    final userCollection = await _localStorage.userCollection;
    await userCollection.isar.writeTxn(() => userCollection.clear());
    log('Cleared database collection');
  }

  Future<void> upsertSelectedFood(SelectedFoodCM selectedFoodCM) async {
    // assert(
    //     selectedFoodCM.selectedDate.isUtc, 'The selected date should be utc');
    final userCollection = await _localStorage.userCollection;

    await userCollection.isar.writeTxn(() async {
      UserCM? user = await userCollection.get(0);
      assert(user != null, 'initilize user when construct this object');

      final updatedUser = user!.copyWith(
        selectedFoods: [selectedFoodCM, ...user.selectedFoods],
      );
      await userCollection.put(updatedUser);
    });
  }

  Future<void> removeSelectedFood(SelectedFoodCM selectedFoodCM) async {
    // assert(
    //     selectedFoodCM.selectedDate.isUtc, 'The selected date should be utc');
    final userCollection = await _localStorage.userCollection;

    await userCollection.isar.writeTxn(() async {
      UserCM? user = await userCollection.get(0);
      assert(user != null, 'initilize user when construct this object');

      final updatedUser = user!.copyWith(
        selectedFoods: user.selectedFoods
            .where((element) => element != selectedFoodCM)
            .toList(),
      );
      await userCollection.put(updatedUser);
    });
  }

  Future<void> removeFood(FoodCM food) async {
    final foodCollection = await _localStorage.foodCollection;
    await foodCollection.isar.writeTxn(() async {
      final filteredFood =
          await foodCollection.filter().nameEqualTo(food.name).findFirst();
      if (filteredFood == null) return;

      await foodCollection.delete(filteredFood.id);
    });
  }

  Stream<List<SelectedFoodCM>> selectedFoodsList(
      {required DateTime start, required DateTime end}) async* {
    final userCollection = await _localStorage.userCollection;
    final stream =
        await userCollection.isar.txn<Stream<List<SelectedFoodCM>>>(() async {
      return userCollection
          .watchObject(0, fireImmediately: true)
          .asBroadcastStream()
          .map((userCm) {
        final selectedFood = userCm?.selectedFoods
            .where((element) =>
                element.selectedDate.isAfter(start) &&
                element.selectedDate.isBefore(end))
            .toList();
        return selectedFood ?? const [];
      });
    });

    yield* stream;
  }
}
