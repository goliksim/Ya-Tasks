import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

abstract class DataInterface {
  Future<void> init();
  Future<List<Task>?> getTasks();
  Future<Task?> getTask(String id);
  Future<bool> addTask(Task task);
  Future<bool> updateTask(Task task);
  Future<bool> deleteTask(String id);
  Future<bool> updateTasks(List<Task> tasks);
}
