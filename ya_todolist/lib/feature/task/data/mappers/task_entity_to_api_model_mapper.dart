import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

import '../models/remote/task_model_api.dart';

class TaskEntityToApiModelMapper {
  static TaskApiModel map(Task task) {
    return TaskApiModel(
      id: task.id,
      text: task.text,
      importance: task.importance,
      deadline: task.deadline,
      done: task.done,
      createdAt: task.createdAt,
      changedAt: task.changedAt,
      lastUpdatedBy: task.lastUpdatedBy,
      color: task.color,
      deleted: task.deleted,
    );
  }

  static List<TaskApiModel> mapList(List<Task> taskEntities) {
    return taskEntities.map((e) => map(e)).toList();
  }
}
