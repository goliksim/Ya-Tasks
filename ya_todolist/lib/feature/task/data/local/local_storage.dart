import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/domain/data_interface.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/data/local/local_db.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalStorage implements DataInterface {
  final LocalDB db;
  late int? revision;
  String? userId;

  LocalStorage({required this.db, this.userId});

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
    db.patch(savedTasks);
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
    return content;
  }

  @override
  Future<List<Task>> getTasks() async {
    final content = db.getTasks();
    if (content != null) {
      return content;
    } else {
      return [];
    }
  }

  @override
  Future<bool> addTask(Task task) async {
    db.put(task);
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

  @override
  Future<bool> updateTask(Task newTask) async {
    db.updateTask(newTask);
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

  /*@override
  Future<void> deleteTaskWithoutInternet(String id) async {
    await database.update('tasks', {'deleted': 1},
        where: 'id = ?', whereArgs: [id]);
    logger.info('Wait for deleting task from server');
  }*/
}
