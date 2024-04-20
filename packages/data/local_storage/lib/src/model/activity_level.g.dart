// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_level.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityLevelCMAdapter extends TypeAdapter<ActivityLevelCM> {
  @override
  final int typeId = 0;

  @override
  ActivityLevelCM read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityLevelCM.sedentary;
      case 1:
        return ActivityLevelCM.fairyActive;
      case 2:
        return ActivityLevelCM.moderatelyActive;
      case 3:
        return ActivityLevelCM.active;
      case 4:
        return ActivityLevelCM.veryActive;
      default:
        return ActivityLevelCM.sedentary;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityLevelCM obj) {
    switch (obj) {
      case ActivityLevelCM.sedentary:
        writer.writeByte(0);
        break;
      case ActivityLevelCM.fairyActive:
        writer.writeByte(1);
        break;
      case ActivityLevelCM.moderatelyActive:
        writer.writeByte(2);
        break;
      case ActivityLevelCM.active:
        writer.writeByte(3);
        break;
      case ActivityLevelCM.veryActive:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityLevelCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
