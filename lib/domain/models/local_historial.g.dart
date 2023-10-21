// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_historial.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalHistorialAdapter extends TypeAdapter<LocalHistorial> {
  @override
  final int typeId = 1;

  @override
  LocalHistorial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalHistorial(
      id: fields[8] as int?,
      q1: fields[0] as String,
      q2: fields[1] as String,
      q3: fields[2] as String,
      q4: fields[3] as String,
      q5: fields[4] as String,
      q6: fields[5] as String,
      time: fields[6] as String,
      difficulty: fields[7] as String,
      userID: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalHistorial obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.q1)
      ..writeByte(1)
      ..write(obj.q2)
      ..writeByte(2)
      ..write(obj.q3)
      ..writeByte(3)
      ..write(obj.q4)
      ..writeByte(4)
      ..write(obj.q5)
      ..writeByte(5)
      ..write(obj.q6)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.difficulty)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.userID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalHistorialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
