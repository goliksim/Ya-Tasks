import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
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

  Future<String> writeLog(String text) async {
    DateTime date = DateTime.now();
    String finalDateString =
        '${DateFormat.yMd().format(date)} ${DateFormat.jms().format(date)}\t';

    if (kDebugMode && !kIsWeb) {
      final file = await _localFile;
      file.writeAsStringSync('$finalDateString$text\n', mode: FileMode.append);
    }
    return finalDateString + text;
  }

  Future<void> logg(String text) async {
    final finalString = await writeLog(text);
    log(finalString);
  }

  Future<void> fine(String text) async {
    final finalString = await writeLog(text);
    log('\u001b[1;32m $finalString');
  }

  Future<void> warning(String text) async {
    final finalString = await writeLog(text);
    log('\u001b[1;31m $finalString');
  }
}
