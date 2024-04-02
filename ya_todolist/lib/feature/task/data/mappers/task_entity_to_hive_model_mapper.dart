import 'package:ya_todolist/feature/task/data/models/locale/task_model_hive.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

class TaskEntityToHiveModelMapper {
  static TaskHiveModel map(Task task) {
    return TaskHiveModel(
      id: task.id,
      text: task.text,
      importance: _importanceMapper(task.importance),
      deadline: task.deadline,
      done: task.done,
      createdAt: task.createdAt ?? DateTime.now(),
      changedAt: task.changedAt ?? DateTime.now(),
      lastUpdatedBy: task.lastUpdatedBy,
      color: task.color,
      deleted: task.deleted,
    );
  }

  static List<TaskHiveModel> mapList(List<Task> taskEntities) {
    return taskEntities.map((e) => map(e)).toList();
  }
}

HiveImportance _importanceMapper(Importance importance) {
  switch (importance) {
    case Importance.basic:
      return HiveImportance.basic;
    case Importance.low:
      return HiveImportance.low;
    case Importance.important:
      return HiveImportance.important;
  }
}
