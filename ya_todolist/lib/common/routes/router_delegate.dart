import 'package:flutter/material.dart';
import 'package:ya_todolist/feature/home/task_list_page.dart';
import 'package:ya_todolist/feature/task_editor/task_editor_page.dart';
import 'package:ya_todolist/common/logger.dart';
import 'navigation_state.dart';
import 'route_observer.dart';

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

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [MyRouteObserver()],
      pages: [
        MaterialPage(
          name: 'root',
          child: TaskListPage(
            key: UniqueKey(),
            onItemTap: showTaskEditor,
          ),
        ),
        if (state?.isTaskEditor == true)
          MaterialPage(
            name: 'edit',
            child: TaskEditorBuilder(
              key: UniqueKey(),
              taskID: state?.selectedTask,
            ),
          ),
        if (state?.isUnknown == true)
          MaterialPage(
            name: 'edit_empty',
            child: TaskEditorBuilder(
              key: UniqueKey(),
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        state = NavigationState.root();
        Logs.logg('Navigator: Push to root');
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
      Logs.logg('Navigator: Push to empty task');
      state = NavigationState.empty();
    } else {
      Logs.logg('Navigator: Push to item $taskID');
      state = NavigationState.item(taskID);
    }
    notifyListeners();
  }
}
