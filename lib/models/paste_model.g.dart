// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paste_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasteModelAdapter extends TypeAdapter<PasteModel> {
  @override
  final int typeId = 1;

  @override
  PasteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasteModel(
      color: fields[3] as int,
      id: fields[0] as String,
      date: fields[2] as DateTime,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PasteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
