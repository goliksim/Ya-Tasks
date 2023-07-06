import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

class Logs {
  static Logs logImpl = Logs();

  Future<File> get _localFile async {
    final path = await localPath;
    return File('$path/ya_todolist/todolist.log').create(recursive: true);
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
