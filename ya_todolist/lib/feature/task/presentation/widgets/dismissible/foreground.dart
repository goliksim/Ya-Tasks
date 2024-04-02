import 'package:flutter/material.dart';
import 'package:ya_todolist/common/routes/navigator_inherited.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

import '../checkbox.dart';
import '../priority_widget.dart';
import '../task_text.dart';

class TaskForeground extends StatelessWidget {
  const TaskForeground(
      {super.key, required this.task, required this.updateDone});
  final Task task;
  final void Function() updateDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onPressed: () {
            NavigationInherited.of(context)
                .routerDelegate
                .showTaskEditor(task.id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyCheckBox(
                  task: task,
                  updateDone: updateDone,
                ),
                const SizedBox(width: 12), // horizontal offset
                PriorityWidget(priority: task.importance),
                Expanded(
                  child: TaskText(task: task),
                ),
                const SizedBox(width: 14), // horizontal offset
                //TaskInfoButton(task: task),
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
