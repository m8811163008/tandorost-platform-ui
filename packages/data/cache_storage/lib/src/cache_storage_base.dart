import 'package:cache_storage/cache_storage.dart';
import 'package:path_provider/path_provider.dart';

class CacheStorage {
  // static const _secureKey = 'secure-key';
  Isar? isarDB;

  Future<IsarCollection<FoodCM>> get foodCollection async =>
      _openCollection<FoodCM>(
        isTemporary: false,
      );

  Future<IsarCollection<T>> _openCollection<T>(
      {required bool isTemporary}) async {
    final directory = await (isTemporary
        ? getTemporaryDirectory()
        : getApplicationDocumentsDirectory());
    isarDB ??= await Isar.open(
      [
        FoodCMSchema,
        UserCMSchema,
      ],
      directory: directory.path,
    );

    return isarDB!.collection<T>();
  }
}
