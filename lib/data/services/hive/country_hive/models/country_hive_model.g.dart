// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryHiveModelAdapter extends TypeAdapter<CountryHiveModel> {
  @override
  final int typeId = 0;

  @override
  CountryHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryHiveModel(
      capital: fields[5] as String,
      code: fields[0] as String,
      continentCode: fields[3] as String,
      continentName: fields[4] as String,
      currency: fields[6] as String,
      emoji: fields[7] as String,
      name: fields[1] as String,
      phone: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CountryHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.continentCode)
      ..writeByte(4)
      ..write(obj.continentName)
      ..writeByte(5)
      ..write(obj.capital)
      ..writeByte(6)
      ..write(obj.currency)
      ..writeByte(7)
      ..write(obj.emoji);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
