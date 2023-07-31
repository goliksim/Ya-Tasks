import 'package:flutter/material.dart';

import '../logger.dart';
import 'navigation_state.dart';

class Routes {
  static const root = '';
  static const task = 'task';
  static const empty = 'empty';
}

/// URI <> NavigationState
class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final location = routeInformation.location;
    if (location == null) {
      return NavigationState.empty();
    }

    final uri = Uri.parse(location);

    // /
    if (uri.pathSegments.isEmpty) {
      Logs.logg('Navigator: Launch app without deeplink');
      return NavigationState.root();
    }
    // /task/<id>
    if (uri.pathSegments.length == 2) {
      final itemId = uri.pathSegments[1];

      if (uri.pathSegments[0] == Routes.task) {
        Logs.logg('Navigator: Launch app with $itemId deeplink path');
        return NavigationState.item(itemId);
      }

      return NavigationState.empty();
    }

    if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      Logs.logg('Navigator: Launch app with $path deeplink path');
      if (path == Routes.task) {
        return NavigationState.empty();
      }

      return NavigationState.root();
    }
    Logs.logg('Navigator: Launch app with empty deeplink path');
    return NavigationState.root();
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration.isTaskEditor) {
      return RouteInformation(
          location: '/${Routes.task}/${configuration.selectedTask}');
    }

    if (configuration.isUnknown) {
      return const RouteInformation(location: '/${Routes.task}');
    }

    return const RouteInformation(location: '/');
  }
}
