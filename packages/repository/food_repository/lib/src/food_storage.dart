import 'package:cache_storage/cache_storage.dart';

class FoodStorage {
  final CacheStorage _cacheStorage;
  FoodStorage(this._cacheStorage);

  Future<void> initializeFood() async {
    final fo1 = FoodCM()
      ..name = 'Apple'
      ..calorie = 52;
    final foodCollection = await _cacheStorage.foodCollection;
    await foodCollection.put(fo1);
  }

  Future<List<FoodCM>> getFoods() async {
    final foodCollection = await _cacheStorage.foodCollection;

    return await foodCollection.where().findAll();
  }

  Future<void> addFood(FoodCM foodCM) async {
    final foodCollection = await _cacheStorage.foodCollection;
    await foodCollection.put(foodCM);
    return;
  }
}
