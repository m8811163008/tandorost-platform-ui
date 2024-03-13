import 'dart:io';

import 'package:cache_storage/cache_storage.dart';
import 'package:path_provider/path_provider.dart';

class CacheStorage {
  // static const _secureKey = 'secure-key';
  Isar? isarDB;

  Directory? tempDirectory;
  Directory? applicationDirectory;

  // Future<Directory> temp() async {
  //   tempDirectory ??= await getTemporaryDirectory();
  //   return tempDirectory!;
  // }

  // Future<void> writeTxn(void Function(Isar isar) callback) async {
  //   await isarDB!.writeTxn(callback);
  // }

  // Future<IsarCollection<FoodCM>> get foodCollection async =>
  //     _openCollection<FoodCM>(
  //       isTemporary: false,
  //     );

  // Future<IsarCollection<T>> _openCollection<T>(
  //     {required bool isTemporary}) async {
  //   final directory =
  //       await (isTemporary ? _temporaryDirectory : _applicationDirectory);
  //   isarDB ??= await Isar.open(
  //     [
  //       FoodCMSchema,
  //       UserCMSchema,
  //     ],
  //     directory: directory.path,
  //   );

  //   return isarDB!.collection<T>();
  // }

  // Future<Directory> get _applicationDirectory async {
  //   applicationDirectory ??= await getApplicationDocumentsDirectory();
  //   return applicationDirectory!;
  // }
}
