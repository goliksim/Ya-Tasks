import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/home/task_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'common/theme_constants.dart';
import 'feature/task/bloc/tasks_bloc.dart';
import 'feature/task/data/storage/storage.dart';

void main() {
  runZonedGuarded(
    () {
      //zoneBody /*обработка ошибок Firebase Crashlytics Bloc.observer, logger, stack_trace*/
      runApp(
        const MyApp(),
      );
    },
    //exceptionWork
    (error, stackTrace) => logs.writeLog('Catch in mainZone $error'),
  );
}

//ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: myLightTheme,
        darkTheme: myDarkTheme,
        //themeMode: _themeManager.themeMode,
        home: const TaskListPage(),
      ),
    );
  }
}
