import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ya_todolist/feature/domain/entities/task_entitiy.dart';

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
  late SharedPreferences prefs;

  Future<List<Task>> readTasks() async {
    prefs = await SharedPreferences.getInstance();
    try {
      final text = prefs.getString('saved');

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

  Future<void> writeTasks(List<Task> savedTasks) async {
    String text = jsonEncode(savedTasks.map((e) => e.toJson()).toList());
    logs.writeLog('Tasks info saved');
    prefs.setString('saved', text);
  }
}
