import 'package:flutter/material.dart';
import 'package:ya_todolist/app/config.dart';

import 'remote_config_inherited.dart';

class RemoteConfigWidget extends StatefulWidget {
  const RemoteConfigWidget(
      {super.key, required this.child, this.disabled = false});
  final bool disabled;
  final Widget child;
  @override
  State<RemoteConfigWidget> createState() => _RemoteConfigWidgetState();
}

class _RemoteConfigWidgetState extends State<RemoteConfigWidget> {
  //final _routerDelegate = MyRouterDelegate();
  String? priorityColor;
  final firebaseConfig = FirebaseConfig();

  @override
  void initState() {
    super.initState();
    if (!widget.disabled) getConfigColor();
  }

  Future<void> getConfigColor() async {
    await firebaseConfig.remoteConfigUpdate(updateValues);
  }

  void updateValues(String color) {
    setState(() {
      if (color.length <= 6) {
        color = 'FF$color';
      }
      priorityColor = '0x$color';
    });
  }

  @override
  Widget build(BuildContext context) {
    return RemoteConfigInherited(
      priorityColor: priorityColor,
      child: Builder(
        builder: (innerContext) {
          return widget.child;
        },
      ),
    );
  }
}
