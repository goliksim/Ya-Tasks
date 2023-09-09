import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/app/remoteConfig/remote_config_inherited.dart';
import 'package:ya_todolist/app/remoteConfig/remote_config_widget.dart';
import 'package:ya_todolist/common/routes/navigator_inherited.dart';
import 'package:ya_todolist/common/routes/route_info_parser.dart';
import 'package:ya_todolist/common/routes/router_delegate.dart';
import 'package:ya_todolist/feature/task/data/local/local_db.dart';
import 'package:ya_todolist/feature/task/data/local/local_storage.dart';
import 'package:ya_todolist/feature/task/data/network/network_storage.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:ya_todolist/feature/task_editor/bloc/editor_bloc.dart';
import '../common/theme_constants.dart';
import '../feature/task/bloc/tasks_bloc.dart';

import '../feature/task/data/network/network_settings.dart';

//ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RemoteConfigWidget(
      disabled: true,
      child: FlavorBanner(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<EditorBloc>(
              create: (context) => EditorBloc(),
            ),
            BlocProvider<TasksBloc>(
                create: (blocContext) => TasksBloc(
                      editorBloc: blocContext.read<EditorBloc>(),
                      repository: Repository(
                        disableNet: true,
                        networkStorage: NetworkStorage(
                          networkSettings: NetworkSettings(),
                        ),
                        localStorage: LocalStorage(db: LocalDB()),
                      ),
                    )..add(const LoadTasks()))
          ],
          child: NavigationInherited(
            routeInformationParser: MyRouteInformationParser(),
            routerDelegate: MyRouterDelegate(),
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return MaterialApp.router(
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  theme: MyTheme.lightData(context.priorityColor),
                  darkTheme: MyTheme.darkData(context.priorityColor),
                  //themeMode: _themeManager.themeMode,
                  routerDelegate: context.routerDelegate,
                  routeInformationParser: context.routeParser,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
