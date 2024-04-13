// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
import 'package:local_storage/src/model/model.dart';

part 'profile.g.dart';

@HiveType(typeId: TypeIDs.profileCM)
class ProfileCM {
  static const id = 0;

  @HiveField(0)
  final String userName;
  @HiveField(1)
  final DateTime? birthday;

  /// in format of --/--/----
  @HiveField(2)
  final String? birthdayShamsi;
  @HiveField(3)
  final bool? isMale;
  @HiveField(4)
  final BodyCompositionCM bodyComposition;
  @HiveField(5)
  final SettingCM settingCM;

  const ProfileCM.empty()
      : userName = '',
        bodyComposition = const BodyCompositionCM.empty(),
        birthday = null,
        birthdayShamsi = null,
        isMale = null,
        settingCM = const SettingCM.empty();

  const ProfileCM(
      {required this.userName,
      this.birthday,
      this.birthdayShamsi,
      this.isMale,
      required this.bodyComposition,
      required this.settingCM});

  ProfileCM copyWith({
    String? userName,
    DateTime? birthday,
    String? birthdayShamsi,
    bool? isMale,
    BodyCompositionCM? bodyComposition,
    SettingCM? settingCM,
  }) {
    return ProfileCM(
      userName: userName ?? this.userName,
      birthday: birthday ?? this.birthday,
      birthdayShamsi: birthdayShamsi ?? this.birthdayShamsi,
      isMale: isMale ?? this.isMale,
      bodyComposition: bodyComposition ?? this.bodyComposition,
      settingCM: settingCM ?? this.settingCM,
    );
  }

  @override
  bool operator ==(covariant ProfileCM other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.birthday == birthday &&
        other.birthdayShamsi == birthdayShamsi &&
        other.isMale == isMale &&
        other.bodyComposition == bodyComposition &&
        other.settingCM == settingCM;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        birthday.hashCode ^
        birthdayShamsi.hashCode ^
        isMale.hashCode ^
        bodyComposition.hashCode ^
        settingCM.hashCode;
  }
}

@HiveType(typeId: TypeIDs.settingCM)
class SettingCM {
  @HiveField(0)
  final ChangeWeightSpeed changeWeightSpeed;
  const SettingCM({
    required this.changeWeightSpeed,
  });

  const SettingCM.empty() : changeWeightSpeed = ChangeWeightSpeed.slowAndEasy;

  SettingCM copyWith({
    ChangeWeightSpeed? changeWeightSpeed,
  }) {
    return SettingCM(
      changeWeightSpeed: changeWeightSpeed ?? this.changeWeightSpeed,
    );
  }

  @override
  bool operator ==(covariant SettingCM other) {
    if (identical(this, other)) return true;

    return other.changeWeightSpeed == changeWeightSpeed;
  }

  @override
  int get hashCode => changeWeightSpeed.hashCode;
}

@HiveType(typeId: TypeIDs.bodyCompositionCM)
class BodyCompositionCM {
  @HiveField(0)
  final List<BioDataCM> height;
  @HiveField(1)
  final List<BioDataCM> weight;
  @HiveField(2)
  final List<BioDataCM> waistCircumference;
  @HiveField(3)
  final List<BioDataCM> armCircumference;
  @HiveField(4)
  final List<BioDataCM> chestCircumference;
  @HiveField(5)
  final List<BioDataCM> thightCircumference;
  @HiveField(6)
  final List<BioDataCM> calfMuscleCircumference;
  @HiveField(7)
  final List<BioDataCM> hipCircumference;
  @HiveField(8)
  final List<ActivityLevelCMData> activityLevel;
  @HiveField(9)
  final DateTime? startBodycompositionChanging;

  const BodyCompositionCM({
    this.height = const [],
    this.weight = const [],
    this.waistCircumference = const [],
    this.armCircumference = const [],
    this.chestCircumference = const [],
    this.thightCircumference = const [],
    this.calfMuscleCircumference = const [],
    this.hipCircumference = const [],
    this.activityLevel = const [],
    this.startBodycompositionChanging,
  });

  const BodyCompositionCM.empty()
      : height = const [],
        weight = const [],
        waistCircumference = const [],
        armCircumference = const [],
        chestCircumference = const [],
        thightCircumference = const [],
        calfMuscleCircumference = const [],
        hipCircumference = const [],
        activityLevel = const [],
        startBodycompositionChanging = null;

  BodyCompositionCM copyWith({
    List<BioDataCM>? height,
    List<BioDataCM>? weight,
    List<BioDataCM>? waistCircumference,
    List<BioDataCM>? armCircumference,
    List<BioDataCM>? chestCircumference,
    List<BioDataCM>? thightCircumference,
    List<BioDataCM>? calfMuscleCircumference,
    List<BioDataCM>? hipCircumference,
    List<ActivityLevelCMData>? activityLevel,
    DateTime? startBodycompositionChanging,
  }) {
    return BodyCompositionCM(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      waistCircumference: waistCircumference ?? this.waistCircumference,
      armCircumference: armCircumference ?? this.armCircumference,
      chestCircumference: chestCircumference ?? this.chestCircumference,
      thightCircumference: thightCircumference ?? this.thightCircumference,
      calfMuscleCircumference:
          calfMuscleCircumference ?? this.calfMuscleCircumference,
      hipCircumference: hipCircumference ?? this.hipCircumference,
      activityLevel: activityLevel ?? this.activityLevel,
      startBodycompositionChanging:
          startBodycompositionChanging ?? this.startBodycompositionChanging,
    );
  }

  @override
  bool operator ==(covariant BodyCompositionCM other) {
    if (identical(this, other)) return true;

    return listEquals(other.height, height) &&
        listEquals(other.weight, weight) &&
        listEquals(other.waistCircumference, waistCircumference) &&
        listEquals(other.armCircumference, armCircumference) &&
        listEquals(other.chestCircumference, chestCircumference) &&
        listEquals(other.thightCircumference, thightCircumference) &&
        listEquals(other.calfMuscleCircumference, calfMuscleCircumference) &&
        listEquals(other.hipCircumference, hipCircumference) &&
        listEquals(other.activityLevel, activityLevel) &&
        other.startBodycompositionChanging == startBodycompositionChanging;
  }

  @override
  int get hashCode {
    return height.hashCode ^
        weight.hashCode ^
        waistCircumference.hashCode ^
        armCircumference.hashCode ^
        chestCircumference.hashCode ^
        thightCircumference.hashCode ^
        calfMuscleCircumference.hashCode ^
        hipCircumference.hashCode ^
        activityLevel.hashCode ^
        startBodycompositionChanging.hashCode;
  }
}

@HiveType(typeId: TypeIDs.bioDataCM)
class BioDataCM {
  @HiveField(0)
  final DateTime logDate;
  @HiveField(1)
  final num value;

  BioDataCM({required this.logDate, required this.value});

  BioDataCM copyWith({
    DateTime? logDate,
    num? value,
  }) {
    return BioDataCM(
      logDate: logDate ?? this.logDate,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(covariant BioDataCM other) {
    if (identical(this, other)) return true;

    return other.logDate == logDate && other.value == value;
  }

  @override
  int get hashCode => logDate.hashCode ^ value.hashCode;
}

@HiveType(typeId: TypeIDs.activityLevelCMData)
class ActivityLevelCMData {
  @HiveField(0)
  final DateTime logDate;
  @HiveField(1)
  final ActivityLevelCM value;

  factory ActivityLevelCMData.empty() {
    return ActivityLevelCMData(
        logDate: DateTime.now(), value: ActivityLevelCM.fairyActive);
  }

  ActivityLevelCMData({required this.logDate, required this.value});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivityLevelCMData && other.logDate == logDate;
  }

  @override
  int get hashCode => logDate.hashCode;

  ActivityLevelCMData copyWith({
    DateTime? logDate,
    ActivityLevelCM? value,
  }) {
    return ActivityLevelCMData(
      logDate: logDate ?? this.logDate,
      value: value ?? this.value,
    );
  }
}
