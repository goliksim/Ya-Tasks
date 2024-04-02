import 'package:hive_flutter/hive_flutter.dart';
import 'package:ya_todolist/feature/task/data/models/locale/task_model_hive.dart';

class LocalDB {
  static const String _taskKey = 'TasksBox';
  static const String _configKey = 'configBox';
  Box<TaskHiveModel>? _taskBox;
  Box<String>? _configBox;
  bool _isInitialized = false;

  Box<TaskHiveModel> get boxInstance {
    _taskBox ??= Hive.box<TaskHiveModel>(_taskKey);
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
    if (!_isInitialized) {
      _isInitialized = true;
      await Hive.initFlutter();
      Hive.registerAdapter(TaskAdapter());
      Hive.registerAdapter(HiveImportanceAdapter());
      //Hive.registerAdapter(ColorAdapter());
      _taskBox = await Hive.openBox<TaskHiveModel>(_taskKey);
      _configBox = await Hive.openBox<String>(_configKey);
    }
  }

  Future<void> clearDB() async {
    await _taskBox?.deleteFromDisk();
    await _configBox?.deleteFromDisk();
    Hive.close();
  }

  TaskHiveModel? getTask(String id) {
    return boxInstance.get(id);
  }

  List<TaskHiveModel>? getTasks() {
    return boxInstance.values.toList();
  }

  void put(TaskHiveModel task) {
    boxInstance.put(task.id, task);
  }

  void putWithId(String id, TaskHiveModel task) {
    boxInstance.put(id, task);
  }

  void delete(String id) {
    boxInstance.delete(id);
  }

  void patch(List<TaskHiveModel> tasks) {
    boxInstance.clear();
    boxInstance.addAll(tasks);
  }

  void clearBox() {
    boxInstance.clear();
  }

  void updateTask(TaskHiveModel task) {
    boxInstance.put(task.id, task);
  }

  Stream<List<TaskHiveModel>> observeAll() async* {
    while (!_isInitialized) {
      await Future.delayed(const Duration(seconds: 1));
    }
    //boxInstance.watch().map((event) => event.value).forEach((element) {print(element);});
    yield* boxInstance.watch().map((event) => boxInstance.values.toList());
  }
}
