import 'package:flutter/material.dart';
import 'package:ya_todolist/feature/home/task_list_page.dart';
import 'package:ya_todolist/feature/task_editor/task_editor_page.dart';
import 'package:ya_todolist/common/logger.dart';
import 'navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  NavigationState? state;

  @override
  NavigationState get currentConfiguration {
    return state ?? NavigationState.root();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: TaskListPage(
            key: UniqueKey(),
            onItemTap: showTaskEditor,
          ),
        ),
        if (state?.isTaskEditor == true)
          MaterialPage(
            child: TaskEditorPage(
              key: UniqueKey(),
              taskID: state?.selectedTask,
            ),
          ),
        if (state?.isUnknown == true)
          MaterialPage(
            child: TaskEditorPage(
              key: UniqueKey(),
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        state = NavigationState.root();
        Logs.logImpl.logg('Navigator: Push to root');
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    notifyListeners();
  }

  void showTaskEditor(String? taskID) {
    if (taskID == null) {
      Logs.logImpl.logg('Navigator: Push to empty task');
      state = NavigationState.empty();
    } else {
      Logs.logImpl.logg('Navigator: Push to item $taskID');
      state = NavigationState.item(taskID);
    }
    notifyListeners();
  }
}
