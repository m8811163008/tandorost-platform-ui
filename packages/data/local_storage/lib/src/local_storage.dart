import 'dart:io';

import 'package:local_storage/local_storage.dart';

class LocalStorage {
  //TODO static const _secureKey = 'secure-key';
  static const _tepmoraryIsarName = 'temporary-isar-name';
  static const _persistIsarName = 'persist-isar-name';
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

  /// This collection has data about food.has unique id for each food.
  Future<IsarCollection<FoodCM>> get foodCollection async =>
      _openCollection<FoodCM>(
        isTemporary: false,
      );

  /// This collection has units of measurement.

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
      name: isTemporary ? _tepmoraryIsarName : _persistIsarName,
    );

    return isarDB!.collection<T>();
  }
}
