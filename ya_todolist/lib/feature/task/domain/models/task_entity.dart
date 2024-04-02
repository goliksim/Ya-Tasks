import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';

enum Importance { basic, low, important }

@freezed
class Task with _$Task {
  const factory Task({
    @Default('') String id,
    @Default('') String text,
    @Default(Importance.basic) Importance importance,
    DateTime? deadline, //optional
    @Default(false) bool done,
    DateTime? createdAt, //optional
    DateTime? changedAt, //optional
    @Default('') String lastUpdatedBy,
    @Default('#FFFFFF') String? color, //optional
    @Default(false) bool deleted,
  }) = _Task;

  @override
  String toString() {
    String finalText = text.length < 30 ? text : '${text.substring(0, 30)}...';
    return 'Task(id: $id, text: ${finalText.replaceAll('\n', '  ')}, importance: $importance, deadline: $deadline, done: $done, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy, color: $color, deleted: $deleted)';
  }
}
