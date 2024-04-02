import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/mappers/task_entity_to_hive_model_mapper.dart';
import 'package:ya_todolist/feature/task/data/mappers/task_hive_model_to_entity_mapper.dart';
import 'package:ya_todolist/feature/task/domain/repositories/data_interface.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';
import 'package:ya_todolist/feature/task/data/datasources/local_datasource_hive_impl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ya_todolist/feature/task/domain/repositories/repository_subject.dart';

class LocalStorageImpl implements DataInterface, TasksSubject {
  final LocalDB db;
  late int? revision;
  String? userId;

  LocalStorageImpl({required this.db, this.userId});

  @override
  Future<void> init() async {
    await db.init();
    await readRev();
    await readId();
    Logs.fine('LocalStorage: inited.');
  }

  static final String _uniqueId = const Uuid().v4();

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      var webBrouserInfo = await deviceInfo.webBrowserInfo;
      return webBrouserInfo.userAgent;
    } else {
      if (Platform.isIOS) {
        // import 'dart:io'
        var iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor; // unique ID on iOS
      } else if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.id; // unique ID on Android
      }
    }
    return _uniqueId;
  }

  Future<String?> readId() async {
    final tmp = db.getId;
    if (tmp != null) {
      userId = tmp;
    } else {
      Logs.warning('LocalStorage: CANNOT LOAD USER ID');
      userId = await getId();

      db.putId('$userId');
    }
    return userId;
  }

  Future<int?> readRev() async {
    final tmp = db.getRev;
    if (tmp != null) {
      revision = int.parse(tmp);
    } else {
      Logs.warning('LocalStorage: CANNOT LOAD STORAGE REV');
      revision = -1;
    }
    return revision;
  }

  Future<void> writeInfo(List<Task> savedTasks, int rev) async {
    Logs.logg('LocalStorage: tasks info saved');
    db.patch(TaskEntityToHiveModelMapper.mapList(savedTasks));
    revision = rev;
    await writeRev(rev);
  }

  Future<void> writeRev(int rev) async {
    db.putRev('$rev');
  }

  Future<void> deleteAllTasks() async {
    db.clearBox();
    await writeInfo([], revision! + 1);
  }

  @override
  Future<Task> getTask(String id) async {
    final content = db.getTask(id)!;
    return TaskHiveModelToEntityMapper.map(content);
  }

  @override
  Future<List<Task>> getTasks() async {
    final content = db.getTasks();
    if (content != null) {
      return TaskHiveModelToEntityMapper.mapList(content);
    } else {
      return [];
    }
  }

  @override
  Future<bool> addTask(Task task) async {
    db.put(TaskEntityToHiveModelMapper.map(task));
    await writeRev(revision! + 1);
    Logs.logg('LocalStorage: Sucessful add task');
    return true;
  }

  @override
  Future<bool> deleteTask(String id) async {
    db.delete(id);
    await writeRev(revision! + 1);
    Logs.logg('LocalStorage: sucessful delete task $id');
    return true;
  }

  Future<bool> markTaskAsDeleted(String id) async {
    final task = await getTask(id);
    db.updateTask(
        TaskEntityToHiveModelMapper.map(task.copyWith(deleted: true)));
    await writeRev(revision! + 1);
    Logs.logg('LocalStorage: sucessful mark deleted task');
    return true;
  }

  @override
  Future<bool> updateTask(Task newTask) async {
    db.updateTask(TaskEntityToHiveModelMapper.map(newTask));
    await writeRev(revision! + 1);
    Logs.logg('LocalStorage: sucessful update task');
    return true;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    await writeInfo(tasks, revision! + 1);
    Logs.logg('LocalStorage: sucessful update task');
    return true;
  }

  @override
  Stream<List<Task>> observeAll() {
    return db.observeAll().map((e) => TaskHiveModelToEntityMapper.mapList(e));
  }

  /*@override
  Future<void> deleteTaskWithoutInternet(String id) async {
    await database.update('tasks', {'deleted': 1},
        where: 'id = ?', whereArgs: [id]);
    logger.info('Wait for deleting task from server');
  }*/
}
