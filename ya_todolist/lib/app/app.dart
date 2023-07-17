import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/app/config.dart';
import 'package:ya_todolist/common/routes/router_delegate.dart';
import 'package:ya_todolist/feature/task/data/local/local_settings.dart';
import 'package:ya_todolist/feature/task/data/local/local_storage.dart';
import 'package:ya_todolist/feature/task/data/network/network_storage.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import '../common/routes/route_info_parser.dart';
import '../common/theme_constants.dart';
import '../feature/task/bloc/tasks_bloc.dart';

import '../feature/task/data/network/network_settings.dart';

//ThemeManager _themeManager = ThemeManager();
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final _routerDelegate = MyRouterDelegate();
  String? priorityColor;
  final _routeInformationParser = MyRouteInformationParser();
  final firebaseConfig = FirebaseConfig();

  @override
  void initState() {
    super.initState();
    getConfigColor();
  }

  void updateValues(String color) {
    setState(() {
      if (color.length <= 6) {
        color = 'FF$color';
      }
      priorityColor = '0x$color';
    });
  }

  Future<void> getConfigColor() async {
    await firebaseConfig.remoteConfigUpdate(updateValues);
  }

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: BlocProvider<TasksBloc>(
        create: (context) => TasksBloc(
          routerDelegate: MyRouterDelegate(),
          repository: Repository(
            networkStorage: NetworkStorage(
              networkSettings: NetworkSettings(),
            ),
            localStorage: LocalStorage(localSettings: LocalSettings()),
          ),
        )..add(const LoadTasks()),
        child: BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightData(priorityColor),
            darkTheme: MyTheme.darkData(priorityColor),
            //themeMode: _themeManager.themeMode,
            routerDelegate: context.taskState!.routerDelegate,
            routeInformationParser: _routeInformationParser,
          );
        }),
      ),
    );
  }
}
