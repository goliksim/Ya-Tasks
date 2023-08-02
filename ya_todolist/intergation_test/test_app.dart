import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/routes/route_info_parser.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'test_constants.dart';

class TestApp {
  static final _routeInformationParser = MyRouteInformationParser();

  static Widget build(RepositoryMock repositoryMock, {String locale = 'en'}) {
    return BlocProvider<TasksBloc>(
      create: (context) => TasksBloc(
        repository: repositoryMock,
      )..add(const LoadTasks()),
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: [Locale(locale)],
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightData(),
            darkTheme: MyTheme.darkData(),
            //themeMode: _themeManager.themeMode,
            //routerDelegate: context.taskState!.routerDelegate,
            routeInformationParser: _routeInformationParser,
          );
        },
      ),
    );
  }
}
