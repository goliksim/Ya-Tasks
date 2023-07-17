import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

import '../../app/di.dart';
import 'bloc/tasks_bloc.dart';
import 'widgets/checkbox.dart';
import 'widgets/priority_widget.dart';
import 'widgets/task_info_button.dart';
import 'widgets/task_text.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({required this.task, super.key});
  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  void updateDone() {
    BlocProvider.of<TasksBloc>(context)
        .add(UpdateTask(task: widget.task.copyWith(done: !widget.task.done)));
    Locator.analytics.logEvent(name: 'task_done', parameters: {
      'before_deadline': (widget.task.deadline != null)
          ? DateTime.now().isBefore(widget.task.deadline!)
          : 'none',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {},
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.startToEnd) {
          updateDone();
          return false;
        } else {
          BlocProvider.of<TasksBloc>(context)
              .add(DeleteTask(task: widget.task));
          return true;
        }
      },
      key: ValueKey(widget.task),
      background: Container(
        color: context.myColors!.green,
        padding: const EdgeInsets.only(left: 24),
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 24,
          height: 24,
          child: Icon(Icons.check, color: context.myColors!.white),
        ),
      ),
      secondaryBackground: Container(
        color: context.myColors!.red,
        padding: const EdgeInsets.only(right: 24),
        alignment: Alignment.centerRight,
        // ignore: sized_box_for_whitespace
        child: SizedBox(
          width: 24,
          height: 24,
          child: Icon(Icons.delete, color: context.myColors!.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyCheckBox(task: widget.task),
            const SizedBox(width: 12), // horizontal offset
            PriorityWidget(priority: widget.task.importance),
            Expanded(
              child: TaskText(task: widget.task),
            ),
            const SizedBox(width: 14), // horizontal offset
            TaskInfoButton(task: widget.task),
          ],
        ),
      ),
    );
  }
}
