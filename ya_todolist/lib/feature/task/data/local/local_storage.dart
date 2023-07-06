import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/domain/data_interface.dart';
import 'package:ya_todolist/feature/task/domain/task_model.dart';

class LocalStorage implements DataInterface {
  late final SharedPreferences _prefs;
  late int? revision;

  @override
  Future<void> init() async {
    Logs.logImpl.writeLog('localStorage initialization...');
    _prefs = await SharedPreferences.getInstance();
    await readRev();
  }

  Future<int?> readRev() async {
    final tmp = _prefs.getString('rev');
    if (tmp != null) {
      revision = int.parse(tmp);
    } else {
      Logs.logImpl.writeLog('CANNOT LOAD STORAGE REV');
      revision = -1;
    }
    return revision;
  }

  Future<void> writeInfo(List<Task> savedTasks, int rev) async {
    String text = jsonEncode(savedTasks.map((e) => e.toJson()).toList());
    Logs.logImpl.writeLog('Tasks info saved $rev');
    _prefs.setString('saved', text);
    revision = rev;
    _prefs.setString('rev', '$rev');
  }

  Future<void> writeRev(int rev) async {
    _prefs.setString('rev', '$rev');
  }

  Future<void> deleteAllTasks() async {
    await writeInfo([], revision!);
  }

  @override
  Future<Task> getTask(String id) async {
    final text = _prefs.getString('saved');
    final content = (jsonDecode(text!) as List)
        .map((i) => Task.fromJson(i))
        .where((e) => e.id == id)
        .first;
    Logs.logImpl.writeLog('Sucessful get task from local');
    return content;
  }

  @override
  Future<List<Task>> getTasks() async {
    final text = _prefs.getString('saved');
    if (text != null) {
      final content =
          (jsonDecode(text) as List).map((i) => Task.fromJson(i)).toList();
      Logs.logImpl.writeLog('Sucessful get taskList from local');
      return content;
    } else {
      return [];
    }
  }

  @override
  Future<bool> addTask(Task task) async {
    final text = _prefs.getString('saved');
    final content =
        (jsonDecode(text!) as List).map((i) => Task.fromJson(i)).toList();
    content.add(task);
    writeInfo(content, revision!);
    Logs.logImpl.writeLog('Sucessful add task to local');
    return true;
  }

  @override
  Future<bool> deleteTask(String id) async {
    final text = _prefs.getString('saved');
    final content = (jsonDecode(text!) as List)
        .map((i) => Task.fromJson(i))
        .where((e) => e.id != id)
        .toList();
    writeInfo(content, revision!);
    Logs.logImpl.writeLog('Sucessful delete task on local');
    return true;
  }

  @override
  Future<bool> updateTask(Task newTask) async {
    final text = _prefs.getString('saved');
    final content =
        (jsonDecode(text!) as List).map((i) => Task.fromJson(i)).map((task) {
      return task.id == newTask.id ? newTask : task;
    }).toList();
    writeInfo(content, revision!);
    Logs.logImpl.writeLog('Sucessful update task on local');
    return true;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    await writeInfo(tasks, revision! + 1);
    Logs.logImpl.writeLog('Sucessful update task on local');
    return true;
  }

  /*@override
  Future<void> deleteTaskWithoutInternet(String id) async {
    await database.update('tasks', {'deleted': 1},
        where: 'id = ?', whereArgs: [id]);
    logger.info('Wait for deleting task from server');
  }*/

}
