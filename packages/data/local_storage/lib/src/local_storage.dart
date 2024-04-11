import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:local_storage/local_storage.dart';

import 'package:hive/hive.dart';

import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const _secureKey = 'secure-key';
  static const _foodBoxKey = 'food-box-key';
  static const _userBoxKey = 'user-box-key';
  static const _selectedFoodsBoxKey = 'selected-foods-box-key';
  static const _unitOfMeasurementBoxKey = 'uom-box-key';

  LocalStorage({
    @visibleForTesting HiveInterface? hive,
    @visibleForTesting FlutterSecureStorage? secureStorage,
    required this.tempDirectory,
    required this.appDirectory,
  })  : _hive = hive ?? Hive,
        _secureStorage = secureStorage ?? FlutterSecureStorage() {
    try {
      //encripted box
      if (!_hive.isAdapterRegistered(TypeIDs.activityLevelCM)) {
        _hive.init(appDirectory.path);

        _hive.registerAdapter(ActivityLevelCMAdapter());
        _hive.registerAdapter(ActivityLevelCMDataAdapter());
        _hive.registerAdapter(FoodCMAdapter());
        _hive.registerAdapter(MacroNutritionCMAdapter());
        _hive.registerAdapter(UnitOfMeasurmentCMAdapter());

        _hive.registerAdapter(SelectedFoodCMAdapter());
        _hive.registerAdapter(ProfileCMAdapter());
        _hive.registerAdapter(BodyCompositionCMAdapter());
        _hive.registerAdapter(BioDataCMAdapter());
        _hive.registerAdapter(ChangeWeightSpeedAdapter());
        _hive.registerAdapter(SettingCMAdapter());
      }
    } catch (_) {
      throw Exception(
        'shouldn\'t have more than one [KeyValueStorage] instance in your project',
      );
    }
  }
  final Directory tempDirectory;
  final Directory appDirectory;

  final HiveInterface _hive;
  final FlutterSecureStorage _secureStorage;

  // Future<Box<SessionCM>> get sessionBox =>
  //     _openBox(_userBoxKey, isTemporary: false, isSecureBox: true);

  Future<Box<FoodCM>> get foodBox async => _openBox<FoodCM>(
        _foodBoxKey,
        isTemporary: false,
        isSecureBox: false,
      );
  Future<Box<ProfileCM>> get profileBox async => _openBox<ProfileCM>(
        _userBoxKey,
        isTemporary: false,
        isSecureBox: false,
      );
  Future<Box<SelectedFoodCM>> get selectedFoodBox async =>
      _openBox<SelectedFoodCM>(
        _selectedFoodsBoxKey,
        isTemporary: false,
        isSecureBox: false,
      );

  Future<Box<UnitOfMeasurmentCM>> get unitsOfMeasurementCollection async =>
      _openBox<UnitOfMeasurmentCM>(_unitOfMeasurementBoxKey,
          isTemporary: false, isSecureBox: false);

  Future<Box<T>> _openBox<T>(String boxKey,
      {required bool isTemporary, required bool isSecureBox}) async {
    List<int>? encryptionKeyUnit8List;
    if (isSecureBox) {
      final encryptedKey = await _secureStorage.read(key: _secureKey);
      if (encryptedKey == null) {
        final key = _hive.generateSecureKey();
        await _secureStorage.write(
            key: _secureKey, value: base64UrlEncode(key));
      }
      final key = await _secureStorage.read(key: _secureKey);
      encryptionKeyUnit8List = base64Url.decode(key!);
    }
    if (_hive.isBoxOpen(boxKey)) {
      return _hive.box(boxKey);
    }
    final directory = isTemporary ? tempDirectory : appDirectory;
    final encyptionCipher =
        isSecureBox ? HiveAesCipher(encryptionKeyUnit8List!) : null;
    return _hive.openBox(
      boxKey,
      path: directory.path,
      encryptionCipher: encyptionCipher,
    );
  }
}

// class LocalStorage {
//   //TODO static const _secureKey = 'secure-key';
//   static const _tepmoraryIsarName = 'temporary-isar-name';
//   static const _persistIsarName = 'persist-isar-name';
//   Isar? _persistIsarDBInstance;
//   Isar? _temporaryIsarDBInstance;
//   Directory tempDirectory;
//   Directory appDirectory;
//   LocalStorage({
//     required this.tempDirectory,
//     required this.appDirectory,
//   });

//   /// This collection has data about food.has unique id for each food.
//   Future<IsarCollection<FoodCM>> get foodCollection async =>
//       _openCollection<FoodCM>(
//         isTemporary: false,
//       );

//   /// This collection has units of measurement.

//   Future<IsarCollection<UserCM>> get userCollection async =>
//       _openCollection<UserCM>(
//         isTemporary: false,
//       );
//   Future<IsarCollection<UnitOfMeasurmentCM>>
//       get unitsOfMeasurementCollection async =>
//           _openCollection<UnitOfMeasurmentCM>(
//             isTemporary: false,
//           );

//   Future<IsarCollection<T>> _openCollection<T>(
//       {required bool isTemporary}) async {
//     if (isTemporary) {
//       if (Isar.instanceNames.contains(_tepmoraryIsarName)) {
//         _temporaryIsarDBInstance = Isar.getInstance(_tepmoraryIsarName);
//       } else {
//         _temporaryIsarDBInstance ??= await Isar.open(
//           [
//             FoodCMSchema,
//             UserCMSchema,
//           ],
//           directory: tempDirectory.path,
//           name: _tepmoraryIsarName,
//         );
//       }

//       return _temporaryIsarDBInstance!.collection<T>();
//     } else {
//       if (Isar.instanceNames.contains(_persistIsarName)) {
//         _persistIsarDBInstance = Isar.getInstance(_persistIsarName);
//       } else {
//         _persistIsarDBInstance ??= await Isar.open(
//           [
//             FoodCMSchema,
//             UserCMSchema,
//           ],
//           directory: appDirectory.path,
//           name: _persistIsarName,
//         );
//       }

//       return _persistIsarDBInstance!.collection<T>();
//     }
//   }

//   // TODO add import and export to bazzar storage with plugin
//   // add storage date
//   // when ever logged in if the storage is empty then cache a copy auto
//   // if the storage was not empty then add import and export button.
//   Future<String> decodeDB() async {
//     final uc = await userCollection;
//     return await uc.where().exportJsonRaw((Uint8List bytes) {
//       final string = Utf8Decoder().convert(bytes);

//       print(string);
//       return string;
//     });
//   }
// }
