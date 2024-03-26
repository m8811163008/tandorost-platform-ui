import 'dart:async';
import 'dart:io';

import 'package:local_storage/local_storage.dart';

class LocalStorage {
  //TODO static const _secureKey = 'secure-key';
  static const _tepmoraryIsarName = 'temporary-isar-name';
  static const _persistIsarName = 'persist-isar-name';
  Isar? persistIsarDBInstance;
  Isar? temporaryIsarDBInstance;
  Directory tempDirectory;
  Directory appDirectory;
  LocalStorage({
    required this.tempDirectory,
    required this.appDirectory,
  });



  /// This collection has data about food.has unique id for each food.
  Future<IsarCollection<FoodCM>> get foodCollection async =>
      _openCollection<FoodCM>(
        isTemporary: false,
      );

  /// This collection has units of measurement.

  Future<IsarCollection<UserCM>> get userCollection async =>
      _openCollection<UserCM>(
        isTemporary: false,
      );
  Future<UserCM> get currentUser async {
    final userCollectionSync = await userCollection;
    final user = await userCollectionSync.isar.txn<UserCM?>(() {
      return userCollectionSync.isar.collection<UserCM>().get(0);
    });
    return user!;
  }

  Future<IsarCollection<T>> _openCollection<T>(
      {required bool isTemporary}) async {
    if (isTemporary) {
      if (Isar.instanceNames.contains(_tepmoraryIsarName)) {
        temporaryIsarDBInstance = Isar.getInstance(_tepmoraryIsarName);
      } else {
        temporaryIsarDBInstance ??= await Isar.open(
          [
            FoodCMSchema,
            UserCMSchema,
          ],
          directory: tempDirectory.path,
          name: _tepmoraryIsarName,
        );
      }

      return temporaryIsarDBInstance!.collection<T>();
    } else {
      if (Isar.instanceNames.contains(_persistIsarName)) {
        persistIsarDBInstance = Isar.getInstance(_persistIsarName);
      } else {
        persistIsarDBInstance ??= await Isar.open(
          [
            FoodCMSchema,
            UserCMSchema,
          ],
          directory: tempDirectory.path,
          name: _persistIsarName,
        );
      }

      return persistIsarDBInstance!.collection<T>();
    }
  }
}
