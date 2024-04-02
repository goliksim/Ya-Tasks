import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';

class TaskConfirmWidget extends StatelessWidget {
  const TaskConfirmWidget({super.key, required this.paddingNotifier});
  final ValueNotifier<double> paddingNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: paddingNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return Container(
          color: context.myColors!.green,
          padding: EdgeInsets.only(left: 24 + value),
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Icon(Icons.check, color: context.myColors!.white),
          ),
        );
      },
    );
  }
}
