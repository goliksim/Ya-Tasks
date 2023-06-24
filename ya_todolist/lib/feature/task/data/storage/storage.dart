import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ya_todolist/feature/task/domain/task_entitiy.dart';

final TaskStorage tasksStorage = TaskStorage();

final Logs logs = Logs();

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

class Logs {
  Future<File> get _localFile async {
    final path = await localPath;
    return File('$path/pocketchips/poker_chips.log').create(recursive: true);
  }

  Future<File> writeLog(String text) async {
    final file = await _localFile;

    var date = DateTime.now();
    String finalDateString = '${[date.year, date.month, date.day].join('/')} ${[
      date.hour,
      date.minute,
      date.second
    ].join(':')}.${date.millisecond}\t';
    file.writeAsStringSync('$finalDateString$text\n', mode: FileMode.append);
    log(finalDateString + text);
    return file;
  }
}

class TaskStorage {
  SharedPreferences? prefs;
  late int _revision;

  Future<int> readRev() async {
    prefs = await SharedPreferences.getInstance();
    try {
      _revision = int.parse(prefs!.getString('rev')!);
    } catch (e) {
      logs.writeLog('CANNOT LOAD STORAGE REV $e');
      _revision = 0;
    }

    return _revision;
  }

  Future<List<Task>> readTasks() async {
    //prefs = await SharedPreferences.getInstance();
    try {
      final text = prefs!.getString('saved');

      final content =
          (jsonDecode(text!) as List).map((i) => Task.fromJson(i)).toList();
      logs.writeLog('\n\tSAVED TASKS LOADED:\n [${[
        for (var x in content) x.show()
      ].join('\n')}]');

      return content;
    } catch (e) {
      logs.writeLog('EMPTY SAVED TASKS OR ERROR $e');
      return [];
    }
  }

  Future<void> writeTasks(List<Task> savedTasks, int rev) async {
    String text = jsonEncode(savedTasks.map((e) => e.toJson()).toList());
    logs.writeLog('Tasks info saved');
    if (prefs != null) {
      prefs!.setString('saved', text);
      prefs!.setString('rev', '$rev');
    }
  }

  Future<void> writeRev(int rev) async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      prefs!.setString('rev', '$rev');
    }
  }
}
