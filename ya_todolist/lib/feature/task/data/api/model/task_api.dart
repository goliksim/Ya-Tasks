import 'package:flutter/material.dart';

import '../../../domain/task_entitiy.dart';

class ApiTask {
  final String id;
  final String text;
  final String importance;
  final int? deadlineDate; //optional
  final bool done;
  final int createdAt;
  final int changedAt;
  final String lastUpdatedBy;
  final String? color; //optionalX

  ApiTask.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        importance = map['importance'],
        deadlineDate = map['deadline'],
        done = map['done'],
        createdAt = map['created_at'],
        changedAt = map['changed_at'],
        lastUpdatedBy = map['last_updated_by'],
        color = map['color'];
}

class TaskMapper {
  static Task fromApi(ApiTask task) {
    return Task(
      id: task.id,
      done: task.done,
      text: task.text,
      color: Colors.red, //затычка, пока не разбирадся с hex кодом
      lastUpdatedBy: task.lastUpdatedBy,
      importance: enumDecode(task.importance),
      deadline: (task.deadlineDate == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(task.deadlineDate! * 1000),
      createdAt: (task.deadlineDate == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(task.createdAt * 1000),
      changedAt: (task.deadlineDate == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(task.changedAt * 1000),
    );
  }
}

class GetTaskBody {
  final Task task;

  GetTaskBody({
    required this.task,
  });

  String toApi() {
    return "{'id': '${task.id}','text': '${task.text}','importance': '${enumEncode(task.importance)}','done': ${task.done},'deadline': ${(task.deadline != null) ? task.deadline!.millisecondsSinceEpoch ~/ 1000 : null},'color': 'fff', 'created_at': ${task.createdAt!.millisecondsSinceEpoch ~/ 1000}, 'changed_at': ${task.changedAt!.millisecondsSinceEpoch ~/ 1000}, 'last_updated_by': '${task.lastUpdatedBy}',}"
        .replaceAll("'", '"');
  }
}
