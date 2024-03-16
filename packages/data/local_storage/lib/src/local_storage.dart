import 'dart:io';

import 'package:local_storage/local_storage.dart';

class LocalStorage {
  // static const _secureKey = 'secure-key';
  Isar? isarDB;
  Directory tempDirectory;
  Directory appDirectory;
  LocalStorage({
    required this.tempDirectory,
    required this.appDirectory,
  });

  Future<void> writeTxn<E>(
      Future<void> Function(IsarCollection<E> isarCollection) callback) async {
    assert(isarDB != null);
    await isarDB!.writeTxn(() async => callback(isarDB!.collection<E>()));
  }

  Future<IsarCollection<FoodCM>> get foodCollection async =>
      _openCollection<FoodCM>(
        isTemporary: false,
      );
  Future<IsarCollection<UnitOfMeasurmentCM>>
      get unitOfMeasurmentCollection async =>
          _openCollection<UnitOfMeasurmentCM>(
            isTemporary: false,
          );

  Future<IsarCollection<T>> _openCollection<T>(
      {required bool isTemporary}) async {
    final directory = isTemporary ? tempDirectory : appDirectory;
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
