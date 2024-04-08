// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileCMAdapter extends TypeAdapter<ProfileCM> {
  @override
  final int typeId = 5;

  @override
  ProfileCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileCM(
      userName: fields[0] as String,
      birthday: fields[1] as DateTime,
      birthdayShamsi: fields[2] as String,
      isMale: fields[3] as bool,
      bodyComposition: fields[4] as BodyCompositionCM,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileCM obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.birthday)
      ..writeByte(2)
      ..write(obj.birthdayShamsi)
      ..writeByte(3)
      ..write(obj.isMale)
      ..writeByte(4)
      ..write(obj.bodyComposition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BodyCompositionCMAdapter extends TypeAdapter<BodyCompositionCM> {
  @override
  final int typeId = 6;

  @override
  BodyCompositionCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BodyCompositionCM(
      height: (fields[0] as List).cast<BioDataCM>(),
      weight: (fields[1] as List).cast<BioDataCM>(),
      waistCircumference: (fields[2] as List).cast<BioDataCM>(),
      armCircumference: (fields[3] as List).cast<BioDataCM>(),
      chestCircumference: (fields[4] as List).cast<BioDataCM>(),
      thightCircumference: (fields[5] as List).cast<BioDataCM>(),
      calfMuscleCircumference: (fields[6] as List).cast<BioDataCM>(),
      hipCircumference: (fields[7] as List).cast<BioDataCM>(),
      activityLevel: (fields[8] as List).cast<ActivityLevelCMData>(),
      startBodycompositionChanging: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BodyCompositionCM obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.waistCircumference)
      ..writeByte(3)
      ..write(obj.armCircumference)
      ..writeByte(4)
      ..write(obj.chestCircumference)
      ..writeByte(5)
      ..write(obj.thightCircumference)
      ..writeByte(6)
      ..write(obj.calfMuscleCircumference)
      ..writeByte(7)
      ..write(obj.hipCircumference)
      ..writeByte(8)
      ..write(obj.activityLevel)
      ..writeByte(9)
      ..write(obj.startBodycompositionChanging);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BodyCompositionCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BioDataCMAdapter extends TypeAdapter<BioDataCM> {
  @override
  final int typeId = 7;

  @override
  BioDataCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BioDataCM(
      logDate: fields[0] as DateTime,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BioDataCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.logDate)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BioDataCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityLevelCMDataAdapter extends TypeAdapter<ActivityLevelCMData> {
  @override
  final int typeId = 10;

  @override
  ActivityLevelCMData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityLevelCMData(
      logDate: fields[0] as DateTime,
      value: fields[1] as ActivityLevelCM,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityLevelCMData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.logDate)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityLevelCMDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
