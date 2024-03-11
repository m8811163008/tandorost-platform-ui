import 'package:cache_storage/cache_storage.dart';
import 'package:cache_storage/src/model/food.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class CacheStorage {
  // static const _secureKey = 'secure-key';

  Future<IsarCollection<FoodCM>> get foodCollection => _openCollection(
        isTemporary: false,
      );

  Future<IsarCollection<T>> _openCollection<T>(
      {required bool isTemporary}) async {
    final directory = await (isTemporary
        ? getTemporaryDirectory()
        : getApplicationDocumentsDirectory());
    final isarDB = await Isar.open(
      [
        FoodListCMSchema,
        UserCMSchema,
      ],
      directory: directory.path,
    );
    return isarDB.collection<T>();
  }
}
