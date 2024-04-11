// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_weight_speed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChangeWeightSpeedAdapter extends TypeAdapter<ChangeWeightSpeed> {
  @override
  final int typeId = 10;

  @override
  ChangeWeightSpeed read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChangeWeightSpeed.none;
      case 1:
        return ChangeWeightSpeed.slowAndEasy;
      case 2:
        return ChangeWeightSpeed.medium;
      case 3:
        return ChangeWeightSpeed.fastAndHard;
      default:
        return ChangeWeightSpeed.none;
    }
  }

  @override
  void write(BinaryWriter writer, ChangeWeightSpeed obj) {
    switch (obj) {
      case ChangeWeightSpeed.none:
        writer.writeByte(0);
        break;
      case ChangeWeightSpeed.slowAndEasy:
        writer.writeByte(1);
        break;
      case ChangeWeightSpeed.medium:
        writer.writeByte(2);
        break;
      case ChangeWeightSpeed.fastAndHard:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangeWeightSpeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
