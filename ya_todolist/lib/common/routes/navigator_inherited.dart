import 'package:flutter/material.dart';
import 'route_info_parser.dart';
import 'router_delegate.dart';

extension NavigationBuilder on BuildContext {
  MyRouterDelegate? get routerDelegate =>
      NavigationInherited.of(this).routerDelegate;
  MyRouteInformationParser? get routeParser =>
      NavigationInherited.of(this).routeInformationParser;
}

class NavigationInherited extends InheritedWidget {
  const NavigationInherited({
    Key? key,
    required this.routerDelegate,
    required this.routeInformationParser,
    required Widget child,
  }) : super(key: key, child: child);

  final MyRouterDelegate routerDelegate;
  final MyRouteInformationParser routeInformationParser;

  @override
  bool updateShouldNotify(NavigationInherited oldWidget) {
    return oldWidget.routerDelegate != routerDelegate;
  }

  static NavigationInherited of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NavigationInherited>()!;
}
