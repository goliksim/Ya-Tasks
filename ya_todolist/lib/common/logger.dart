import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logs {
  static Logs logIns = Logs();
  SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> writeLog(String text) async {
    final pref = await prefs;
    DateTime date = DateTime.now();
    String finalDateString =
        '${DateFormat.yMd().format(date)} ${DateFormat.jms().format(date)}\t';

    pref.setString('log', finalDateString + text);
    log(finalDateString + text);
  }
}
