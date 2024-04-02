import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';

class TaskDeleteWidget extends StatelessWidget {
  const TaskDeleteWidget({super.key, required this.paddingNotifier});
  final ValueNotifier<double> paddingNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: paddingNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return Container(
          color: context.myColors!.red,
          padding: EdgeInsets.only(right: 24 + value),
          alignment: Alignment.centerRight,
          // ignore: sized_box_for_whitespace
          child: SizedBox(
            width: 24,
            height: 24,
            child: Icon(Icons.delete, color: context.myColors!.white),
          ),
        );
      },
    );
  }
}
