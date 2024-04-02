import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

abstract interface class TasksSubject {
  Stream<List<Task>> observeAll();
}
