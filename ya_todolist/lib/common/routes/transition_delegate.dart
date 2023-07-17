import 'package:flutter/material.dart';

class MyCustomTransitionDelegate extends TransitionDelegate<void> {
  // В этом методе вы определяете анимации и переходы между экранами
  // на основе предоставленной информации.
  // В newPageRoute содержится информация о новом экране, который будет добавлен.
  // В locationToExitingPageRoute содержатся записи о закрывающихся экранах и их маршрутах.

  // Ваш код здесь...

  @override
  Iterable<RouteTransitionRecord> resolve(
      {required List<RouteTransitionRecord> newPageRouteHistory,
      required Map<RouteTransitionRecord?, RouteTransitionRecord>
          locationToExitingPageRoute,
      required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
          pageRouteToPagelessRoutes}) {
    final results = resolve(
      newPageRouteHistory: newPageRouteHistory,
      locationToExitingPageRoute: locationToExitingPageRoute,
      pageRouteToPagelessRoutes: pageRouteToPagelessRoutes,
    );
    return results;
  }
}
