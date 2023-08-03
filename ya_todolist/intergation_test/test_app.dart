import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/routes/navigator_inherited.dart';
import 'package:ya_todolist/common/routes/route_info_parser.dart';
import 'package:ya_todolist/common/routes/router_delegate.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/feature/task_editor/bloc/editor_bloc.dart';
import 'test_constants.dart';

class TestApp {
  static Widget build(RepositoryMock repositoryMock, {String locale = 'en'}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditorBloc>(
          create: (context) => EditorBloc(),
        ),
        BlocProvider<TasksBloc>(
            create: (blocContext) => TasksBloc(
                  editorBloc: blocContext.read<EditorBloc>(),
                  repository: repositoryMock,
                )..add(const LoadTasks()))
      ],
      child: NavigationInherited(
        routeInformationParser: MyRouteInformationParser(),
        routerDelegate: MyRouterDelegate(),
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: [Locale(locale)],
              debugShowCheckedModeBanner: false,
              theme: MyTheme.lightData(null),
              darkTheme: MyTheme.darkData(null),
              //themeMode: _themeManager.themeMode,
              routerDelegate: context.routerDelegate,
              routeInformationParser: context.routeParser,
            );
          },
        ),
      ),
    );
  }
}
