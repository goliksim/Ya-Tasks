import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/domain/task_entitiy.dart';

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
        color: Theme.of(context).colorScheme.onError,
        padding: const EdgeInsets.only(left: 24),
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 24,
          height: 24,
          child:
              Icon(Icons.check, color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      secondaryBackground: Container(
        color: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.only(right: 24),
        alignment: Alignment.centerRight,
        // ignore: sized_box_for_whitespace
        child: SizedBox(
          width: 24,
          height: 24,
          child: Icon(Icons.delete,
              color: Theme.of(context).colorScheme.onPrimary),
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
