import 'package:hive_flutter/hive_flutter.dart';

import '../domain/task_model.dart';

class LocalSettings {
  static const String _taskKey = 'TasksBox';
  static const String _configKey = 'configBox';
  Box<Task>? _taskBox;
  Box<String>? _configBox;

  Box<Task> get boxInstance {
    _taskBox ??= Hive.box<Task>(_taskKey);
    return _taskBox!;
  }

  Box<String> get configInstance {
    _configBox ??= Hive.box<String>(_configKey);
    return _configBox!;
  }

  String? get getId {
    return configInstance.get('id');
  }

  String? get getRev {
    return configInstance.get('rev');
  }

  void putId(String uuid) {
    configInstance.put('id', uuid);
  }

  void putRev(String rev) {
    configInstance.put('rev', rev);
  }

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(ImportanceAdapter());
    //Hive.registerAdapter(ColorAdapter());
    _taskBox = await Hive.openBox<Task>(_taskKey);
    _configBox = await Hive.openBox<String>(_configKey);
  }

  Task? getTask(String id) {
    return boxInstance.get(id);
  }

  List<Task>? getTasks() {
    return boxInstance.values.toList();
  }

  void put(Task task) {
    boxInstance.put(task.id, task);
  }

  void putWithId(String id, Task task) {
    boxInstance.put(id, task);
  }

  void delete(String id) {
    boxInstance.delete(id);
  }

  void patch(List<Task> tasks) {
    boxInstance.clear();
    boxInstance.addAll(tasks);
  }

  void clearBox() {
    boxInstance.clear();
  }

  void updateTask(Task task) {
    boxInstance.put(task.id, task);
  }
}
