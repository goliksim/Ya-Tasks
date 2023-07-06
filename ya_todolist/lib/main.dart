import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/common/routes/router_delegate.dart';
import 'package:ya_todolist/feature/task/data/local/local_storage.dart';
import 'package:ya_todolist/feature/task/data/network/network_storage.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';

import 'common/routes/route_info_parser.dart';
import 'common/theme_constants.dart';
import 'feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/common/logger.dart';

import 'feature/task/data/network/network_settings.dart';

void main() {
  runZonedGuarded(
    () {
      //zoneBody /*обработка ошибок Firebase Crashlytics Bloc.observer, logger, stack_trace*/
    },
    //exceptionWork
    (error, stackTrace) => Logs.logImpl.writeLog('Catch in mainZone $error'),
  );
  runApp(
    MyApp(),
  );
}

//ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  MyApp({super.key});
  //final _routerDelegate = MyRouterDelegate();
  final _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) => TasksBloc(
        routerDelegate: MyRouterDelegate(),
        repository: Repository(
          networkStorage: NetworkStorage(
            networkSettings: NetworkSettings(),
          ),
          localStorage: LocalStorage(),
        ),
      )..add(const LoadTasks()),
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightData,
          darkTheme: MyTheme.darkData,
          //themeMode: _themeManager.themeMode,
          routerDelegate:
              BlocProvider.of<TasksBloc>(context).state.routerDelegate,
          routeInformationParser: _routeInformationParser,
        );
      }),
    );
  }
}
