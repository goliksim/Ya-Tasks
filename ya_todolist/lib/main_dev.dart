import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ya_todolist/app/di.dart';
import 'app/app.dart';
import 'package:ya_todolist/common/logger.dart';

void main() async {
  Locator.init('DEV');
  runZonedGuarded(
    () {
      //zoneBody /*обработка ошибок Firebase Crashlytics Bloc.observer, logger, stack_trace*/
    },
    //exceptionWork
    (error, stackTrace) => Logs.logIns.writeLog('Catch in mainZone $error'),
  );
  runApp(
    const MyApp(),
  );
}
