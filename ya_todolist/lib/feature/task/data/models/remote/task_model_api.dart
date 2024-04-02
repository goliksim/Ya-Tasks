import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

part 'task_model_api.freezed.dart';
part 'task_model_api.g.dart';

@freezed
class TaskApiModel with _$TaskApiModel {
  const factory TaskApiModel({
    @Default('') String id,
    @Default('') String text,
    @Default(Importance.basic) Importance importance,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    DateTime? deadline, //optional
    @Default(false) bool done,
    @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
    DateTime? createdAt, //optional
    @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
    DateTime? changedAt, //optional
    @JsonKey(name: 'last_updated_by') @Default('') String lastUpdatedBy,
    @Default('#FFFFFF') String? color, //optional
    @JsonKey(includeFromJson: true, includeToJson: false)
    @Default(false)
    bool deleted,
  }) = _TaskApiModel;

  factory TaskApiModel.fromJson(Map<String, dynamic> json) =>
      _$TaskApiModelFromJson(json);
}

DateTime? _dateFromJson(int? value) =>
    (value == null) ? null : DateTime.fromMicrosecondsSinceEpoch(value);

int? _dateToJson(DateTime? value) =>
    (value != null) ? value.microsecondsSinceEpoch : null;
