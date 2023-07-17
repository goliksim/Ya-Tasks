import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/domain/data_interface.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/data/local/local_settings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalStorage implements DataInterface {
  final LocalSettings localSettings;
  late int? revision;
  String? userId;

  LocalStorage({required this.localSettings, userId});

  @override
  Future<void> init() async {
    await localSettings.init();
    Logs.logIns.writeLog('Task box inited');
    await readRev();
    Logs.logIns.writeLog('rev readed');
    await readId();
    Logs.logIns.writeLog(' localStorage init.');
  }

  Future<String?> _getId() async {
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
    return null;
  }

  Future<String?> readId() async {
    final tmp = localSettings.getId;
    if (tmp != null) {
      userId = tmp;
    } else {
      Logs.logIns.writeLog('CANNOT LOAD USER ID');
      userId = await _getId();

      localSettings.putId('$userId');
    }
    return userId;
  }

  Future<int?> readRev() async {
    final tmp = localSettings.getRev;
    if (tmp != null) {
      revision = int.parse(tmp);
    } else {
      Logs.logIns.writeLog('CANNOT LOAD STORAGE REV');
      revision = -1;
    }
    return revision;
  }

  Future<void> writeInfo(List<Task> savedTasks, int rev) async {
    Logs.logIns.writeLog('Tasks info saved into storage');
    localSettings.patch(savedTasks);
    revision = rev;
    await writeRev(rev);
  }

  Future<void> writeRev(int rev) async {
    localSettings.putRev('$rev');
  }

  Future<void> deleteAllTasks() async {
    localSettings.clearBox();
    await writeInfo([], revision! + 1);
  }

  @override
  Future<Task> getTask(String id) async {
    final content = localSettings.getTask(id)!;
    return content;
  }

  @override
  Future<List<Task>> getTasks() async {
    final content = localSettings.getTasks();
    if (content != null) {
      return content;
    } else {
      return [];
    }
  }

  @override
  Future<bool> addTask(Task task) async {
    localSettings.put(task);
    await writeRev(revision! + 1);
    Logs.logIns.writeLog('Sucessful add task to local');
    return true;
  }

  @override
  Future<bool> deleteTask(String id) async {
    localSettings.delete(id);
    await writeRev(revision! + 1);
    Logs.logIns.writeLog('Sucessful delete task on local $id');
    return true;
  }

  @override
  Future<bool> updateTask(Task newTask) async {
    localSettings.updateTask(newTask);
    await writeRev(revision! + 1);
    Logs.logIns.writeLog('Sucessful update task on local');
    return true;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    await writeInfo(tasks, revision! + 1);
    Logs.logIns.writeLog('Sucessful update task on local');
    return true;
  }

  /*@override
  Future<void> deleteTaskWithoutInternet(String id) async {
    await database.update('tasks', {'deleted': 1},
        where: 'id = ?', whereArgs: [id]);
    logger.info('Wait for deleting task from server');
  }*/

}
