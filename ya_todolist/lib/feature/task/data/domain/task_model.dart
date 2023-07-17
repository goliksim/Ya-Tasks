import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';
part 'task_model.freezed.dart';

@HiveType(typeId: 2)
enum Importance {
  @HiveField(0)
  basic,
  @HiveField(1)
  low,
  @HiveField(2)
  important
}

@freezed
class Task with _$Task {
  const Task._();

  @HiveType(typeId: 1, adapterName: 'TaskAdapter')
  const factory Task({
    @HiveField(0) @Default('') String id,
    @HiveField(1) @Default('') String text,
    @HiveField(2) @Default(Importance.basic) Importance importance,
    @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
    @HiveField(3)
    DateTime? deadline, //optional
    @HiveField(4) @Default(false) bool done,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    @HiveField(5)
    DateTime? createdAt,
    @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
    @HiveField(6)
    DateTime? changedAt,
    @JsonKey(name: 'last_updated_by')
    @Default('')
    @HiveField(7)
    String lastUpdatedBy,
    @HiveField(8) @Default('#FFFFFF') String? color, //optional
    @JsonKey(includeFromJson: false, includeToJson: false)
    @HiveField(9)
    @Default(false)
    bool deleted,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  String toString() {
    String finalText = text.length < 30 ? text : '${text.substring(0, 30)}...';
    return 'Task(id: $id, text: ${finalText.replaceAll('\n', '  ')}, importance: $importance, deadline: $deadline, done: $done, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy, color: $color, deleted: $deleted)';
  }
}

//Тут мог быть JsonConverter, но он отказывается работать с hive ¯\_(⊙_⊙)_/¯

DateTime? dateFromJson(int? value) =>
    (value == null) ? null : DateTime.fromMillisecondsSinceEpoch(value * 1000);

int? dateToJson(DateTime? value) =>
    (value != null) ? value.millisecondsSinceEpoch ~/ 1000 : null;
