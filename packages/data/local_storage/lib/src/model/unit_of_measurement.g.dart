// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_of_measurement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitOfMeasurmentCMAdapter extends TypeAdapter<UnitOfMeasurmentCM> {
  @override
  final int typeId = 8;

  @override
  UnitOfMeasurmentCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitOfMeasurmentCM(
      title: fields[0] as String,
      icon: fields[1] as String,
      max: fields[3] as int?,
      howManyGrams: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnitOfMeasurmentCM obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.howManyGrams)
      ..writeByte(3)
      ..write(obj.max);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitOfMeasurmentCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
