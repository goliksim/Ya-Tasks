import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ya_todolist/app/di.dart';
import 'app/app.dart';
import 'package:ya_todolist/common/logger.dart';

void main() async {
  runZonedGuarded(
    () async {
      //zoneBody /*обработка ошибок Firebase Crashlytics Bloc.observer, logger, stack_trace*/
      await Locator.init(null);
      runApp(const MyApp());
    },
    //exceptionWork
    (error, stackTrace) =>
        Logs.logImpl.warning('MAIN: Catch in mainZone $error'),
  );
}
