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

  /// write transaction in collection. CRUD and more.
  /// Always add data scheme to writeTxn like E and [FoodCM]
  Future<void> writeTxn<E>(
      IsarCollection<E> collection, Future<void> Function() callback) async {
    collection.isar.writeTxn(callback);
  }

  Future<void> txn<E>(IsarCollection<E> collection,
          Future<void> Function() callback) async =>
      collection.isar.txn(callback);

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
      temporaryIsarDBInstance ??= await Isar.open(
        [
          FoodCMSchema,
          UserCMSchema,
        ],
        directory: tempDirectory.path,
        name: _tepmoraryIsarName,
      );
      return temporaryIsarDBInstance!.collection<T>();
    } else {
      persistIsarDBInstance ??= await Isar.open(
        [
          FoodCMSchema,
          UserCMSchema,
        ],
        directory: tempDirectory.path,
        name: _persistIsarName,
      );
      return persistIsarDBInstance!.collection<T>();
    }
  }
}
