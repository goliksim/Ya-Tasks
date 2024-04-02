// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskApiModel _$$_TaskApiModelFromJson(Map<String, dynamic> json) =>
    _$_TaskApiModel(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      importance:
          $enumDecodeNullable(_$ImportanceEnumMap, json['importance']) ??
              Importance.basic,
      deadline: _dateFromJson(json['deadline'] as int?),
      done: json['done'] as bool? ?? false,
      createdAt: _dateFromJson(json['created_at'] as int?),
      changedAt: _dateFromJson(json['changed_at'] as int?),
      lastUpdatedBy: json['last_updated_by'] as String? ?? '',
      color: json['color'] as String? ?? '#FFFFFF',
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TaskApiModelToJson(_$_TaskApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'deadline': _dateToJson(instance.deadline),
      'done': instance.done,
      'created_at': _dateToJson(instance.createdAt),
      'changed_at': _dateToJson(instance.changedAt),
      'last_updated_by': instance.lastUpdatedBy,
      'color': instance.color,
    };

const _$ImportanceEnumMap = {
  Importance.low: 'low',
  Importance.basic: 'basic',
  Importance.important: 'important',
};
