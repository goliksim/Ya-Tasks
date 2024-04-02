import 'package:ya_todolist/feature/task/data/models/locale/task_model_hive.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

class TaskHiveModelToEntityMapper {
  static Task map(TaskHiveModel task) {
    return Task(
      id: task.id,
      text: task.text,
      importance: _importanceMapper(task.importance),
      deadline: task.deadline,
      done: task.done,
      createdAt: task.createdAt,
      changedAt: task.changedAt,
      lastUpdatedBy: task.lastUpdatedBy,
      color: task.color,
      deleted: task.deleted,
    );
  }

  static List<Task> mapList(List<TaskHiveModel> taskApiModels) {
    return taskApiModels.map((e) => map(e)).toList();
  }
}

Importance _importanceMapper(HiveImportance hiveImportance) {
  switch (hiveImportance) {
    case HiveImportance.basic:
      return Importance.basic;
    case HiveImportance.low:
      return Importance.low;
    case HiveImportance.important:
      return Importance.important;
  }
}
