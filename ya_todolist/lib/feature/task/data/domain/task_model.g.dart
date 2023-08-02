// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportanceAdapter extends TypeAdapter<Importance> {
  @override
  final int typeId = 2;

  @override
  Importance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Importance.basic;
      case 1:
        return Importance.low;
      case 2:
        return Importance.important;
      default:
        return Importance.basic;
    }
  }

  @override
  void write(BinaryWriter writer, Importance obj) {
    switch (obj) {
      case Importance.basic:
        writer.writeByte(0);
        break;
      case Importance.low:
        writer.writeByte(1);
        break;
      case Importance.important:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskAdapter extends TypeAdapter<_$_Task> {
  @override
  final int typeId = 1;

  @override
  _$_Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Task(
      id: fields[0] as String,
      text: fields[1] as String,
      importance: fields[2] as Importance,
      deadline: fields[3] as DateTime?,
      done: fields[4] as bool,
      createdAt: fields[5] as DateTime?,
      changedAt: fields[6] as DateTime?,
      lastUpdatedBy: fields[7] as String,
      color: fields[8] as String?,
      deleted: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Task obj) {
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      importance:
          $enumDecodeNullable(_$ImportanceEnumMap, json['importance']) ??
              Importance.basic,
      deadline: dateFromJson(json['deadline'] as int?),
      done: json['done'] as bool? ?? false,
      createdAt: dateFromJson(json['created_at'] as int?),
      changedAt: dateFromJson(json['changed_at'] as int?),
      lastUpdatedBy: json['last_updated_by'] as String? ?? '',
      color: json['color'] as String? ?? '#FFFFFF',
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'deadline': dateToJson(instance.deadline),
      'done': instance.done,
      'created_at': dateToJson(instance.createdAt),
      'changed_at': dateToJson(instance.changedAt),
      'last_updated_by': instance.lastUpdatedBy,
      'color': instance.color,
    };

const _$ImportanceEnumMap = {
  Importance.basic: 'basic',
  Importance.low: 'low',
  Importance.important: 'important',
};
