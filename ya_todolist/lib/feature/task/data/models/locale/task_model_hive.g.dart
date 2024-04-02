// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveImportanceAdapter extends TypeAdapter<HiveImportance> {
  @override
  final int typeId = 2;

  @override
  HiveImportance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HiveImportance.basic;
      case 1:
        return HiveImportance.low;
      case 2:
        return HiveImportance.important;
      default:
        return HiveImportance.basic;
    }
  }

  @override
  void write(BinaryWriter writer, HiveImportance obj) {
    switch (obj) {
      case HiveImportance.basic:
        writer.writeByte(0);
        break;
      case HiveImportance.low:
        writer.writeByte(1);
        break;
      case HiveImportance.important:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveImportanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskAdapter extends TypeAdapter<_$_TaskHiveModel> {
  @override
  final int typeId = 1;

  @override
  _$_TaskHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_TaskHiveModel(
      id: fields[0] as String,
      text: fields[1] as String,
      importance: fields[2] as HiveImportance,
      deadline: fields[3] as DateTime?,
      done: fields[4] as bool,
      createdAt: fields[5] as DateTime,
      changedAt: fields[6] as DateTime,
      lastUpdatedBy: fields[7] as String,
      color: fields[8] as String?,
      deleted: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_TaskHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.importance)
      ..writeByte(3)
      ..write(obj.deadline)
      ..writeByte(4)
      ..write(obj.done)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.changedAt)
      ..writeByte(7)
      ..write(obj.lastUpdatedBy)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.deleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
