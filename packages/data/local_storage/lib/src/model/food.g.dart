// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodCMAdapter extends TypeAdapter<FoodCM> {
  @override
  final int typeId = 1;

  @override
  FoodCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodCM(
      name: fields[0] as String,
      calorie: fields[1] as double,
      gramsPerUnit: fields[2] as int,
      macroNutrition: fields[3] as MacroNutritionCM,
      isVegetable: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FoodCM obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.calorie)
      ..writeByte(2)
      ..write(obj.gramsPerUnit)
      ..writeByte(3)
      ..write(obj.macroNutrition)
      ..writeByte(4)
      ..write(obj.isVegetable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MacroNutritionCMAdapter extends TypeAdapter<MacroNutritionCM> {
  @override
  final int typeId = 2;

  @override
  MacroNutritionCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MacroNutritionCM(
      carbohydrate: fields[0] as double,
      fat: fields[1] as double,
      protein: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MacroNutritionCM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.carbohydrate)
      ..writeByte(1)
      ..write(obj.fat)
      ..writeByte(2)
      ..write(obj.protein);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MacroNutritionCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
