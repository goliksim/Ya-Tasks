import 'package:flutter/material.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

import '../checkbox.dart';
import '../priority_widget.dart';
import '../task_info_button.dart';
import '../task_text.dart';

class TaskForeground extends StatelessWidget {
  const TaskForeground(
      {super.key, required this.task, required this.updateDone});
  final Task task;
  final void Function() updateDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
          TaskInfoButton(task: task),
        ],
      ),
    );
  }
}
