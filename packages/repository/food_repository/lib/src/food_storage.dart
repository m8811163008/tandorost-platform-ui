import 'package:cache_storage/cache_storage.dart';

class FoodStorage {
  final CacheStorage _cacheStorage;
  FoodStorage(this._cacheStorage);

  Future<void> initializeFood() async {
    final fo1 = FoodDataCM()
      ..name = 'Apple'
      ..calorie = 52;
    final fo2 = FoodCM()..foodDataCM = fo1;
    _cacheStorage.writeTxn((Isar isar) async {
      await isar.foods.put(fo2);
    });
  }

  Future<List<FoodCM>> getFoods() async {
    final foodCollection = await _cacheStorage.foodCollection;

    return await foodCollection.where().findAll();
  }

  Future<void> addFood(FoodCM foodCM) async {
    _cacheStorage.writeTxn((Isar isar) async {
      await isar.foods.put(foodCM);
    });

    return;
  }
}
