// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
import 'package:local_storage/src/model/model.dart';

part 'profile.g.dart';

@HiveType(typeId: 5)
class ProfileCM {
  static const id = 0;

  @HiveField(0)
  final String userName;
  @HiveField(1)
  final DateTime birthday;

  /// in format of --/--/----
  @HiveField(2)
  final String birthdayShamsi;
  @HiveField(3)
  final bool isMale;
  @HiveField(4)
  final BodyCompositionCM bodyComposition;

  factory ProfileCM.empty() {
    return ProfileCM(
      userName: '',
      birthday: DateTime.now(),
      birthdayShamsi: '--/--/----',
      isMale: false,
      bodyComposition: BodyCompositionCM.empty(),
    );
  }

  ProfileCM({
    required this.userName,
    required this.birthday,
    required this.birthdayShamsi,
    required this.isMale,
    required this.bodyComposition,
  });

  ProfileCM copyWith({
    String? userName,
    DateTime? birthday,
    String? birthdayShamsi,
    bool? isMale,
    BodyCompositionCM? bodyComposition,
  }) {
    return ProfileCM(
      userName: userName ?? this.userName,
      birthday: birthday ?? this.birthday,
      birthdayShamsi: birthdayShamsi ?? this.birthdayShamsi,
      isMale: isMale ?? this.isMale,
      bodyComposition: bodyComposition ?? this.bodyComposition,
    );
  }
}

@HiveType(typeId: 6)
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
  final DateTime startBodycompositionChanging;

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
    required this.startBodycompositionChanging,
  });

  factory BodyCompositionCM.empty() {
    return BodyCompositionCM(
      startBodycompositionChanging: DateTime.now(),
    );
  }

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
}

@HiveType(typeId: 7)
class BioDataCM {
  @HiveField(0)
  final DateTime logDate;
  @HiveField(1)
  final int value;

  factory BioDataCM.empty() {
    return BioDataCM(logDate: DateTime.now(), value: -1);
  }

  BioDataCM({required this.logDate, required this.value});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BioDataCM && other.logDate == logDate;
  }

  @override
  int get hashCode => logDate.hashCode;

  BioDataCM copyWith({
    DateTime? logDate,
    int? value,
  }) {
    return BioDataCM(
      logDate: logDate ?? this.logDate,
      value: value ?? this.value,
    );
  }
}

@HiveType(typeId: 10)
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
