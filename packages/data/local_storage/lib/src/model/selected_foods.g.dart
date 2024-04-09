// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_foods.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedFoodCMAdapter extends TypeAdapter<SelectedFoodCM> {
  @override
  final int typeId = 7;

  @override
  SelectedFoodCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedFoodCM(
      food: fields[0] as FoodCM,
      unitOfMeasurmentCM: fields[1] as UnitOfMeasurmentCM,
      numberOfUnitOfMeasurement: fields[2] as int,
      selectedDate: fields[3] as DateTime,
      totalWeight: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedFoodCM obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.food)
      ..writeByte(1)
      ..write(obj.unitOfMeasurmentCM)
      ..writeByte(2)
      ..write(obj.numberOfUnitOfMeasurement)
      ..writeByte(3)
      ..write(obj.selectedDate)
      ..writeByte(4)
      ..write(obj.totalWeight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedFoodCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
