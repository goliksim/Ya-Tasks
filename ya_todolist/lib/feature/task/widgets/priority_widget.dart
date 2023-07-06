import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';

import '../domain/task_model.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key, required this.priority});
  final Importance priority;
  @override
  Widget build(BuildContext context) {
    return priority != Importance.basic
        ? Container(
            width: 16,
            height: 20,
            alignment: Alignment.topCenter,
            child: FittedBox(
              child: priority == Importance.important
                  ? Text(
                      '!!',
                      style: TextStyle(
                        color: context.myColors!.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  : const Text(
                      '⬇',
                      style: TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            ),
          )
        : const SizedBox();
  }
}
