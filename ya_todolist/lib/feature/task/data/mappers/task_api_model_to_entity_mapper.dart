import 'package:ya_todolist/feature/task/data/models/remote/task_model_api.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

class TaskApiModelToEntityMapper {
  static Task map(TaskApiModel task) {
    return Task(
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

  static List<Task> mapList(List<TaskApiModel> taskApiModels) {
    return taskApiModels.map((e) => map(e)).toList();
  }
}
