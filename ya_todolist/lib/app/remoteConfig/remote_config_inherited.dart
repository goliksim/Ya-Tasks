import 'package:flutter/material.dart';

extension RemoteConfigBuilder on BuildContext {
  String? get priorityColor => RemoteConfigInherited.of(this).priorityColor;
}

class RemoteConfigInherited extends InheritedWidget {
  const RemoteConfigInherited({
    Key? key,
    required this.priorityColor,
    required Widget child,
  }) : super(key: key, child: child);

  final String? priorityColor;

  @override
  bool updateShouldNotify(RemoteConfigInherited oldWidget) {
    return oldWidget.priorityColor != priorityColor;
  }

  static RemoteConfigInherited of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RemoteConfigInherited>()!;
}
