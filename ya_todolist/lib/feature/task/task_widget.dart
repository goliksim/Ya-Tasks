import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/app/analytics.dart';
import 'package:ya_todolist/common/widgets/confirm_dialog.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/widgets/dismissible/foreground.dart';

import 'bloc/tasks_bloc.dart';
import 'widgets/dismissible/background.dart';
import 'widgets/dismissible/sec_background.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({required this.task, super.key});
  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  void updateDone() async {
    BlocProvider.of<TasksBloc>(context)
        .add(UpdateTask(task: widget.task.copyWith(done: !widget.task.done)));
    Analytics.logEvent('task_done', widget.task);
  }

  @override
  void initState() {
    super.initState();
  }

  void callback() {
    setState(() {
      animation != animation;
    });
  }

  final ValueNotifier<double> _padding = ValueNotifier<double>(0);
  bool animation = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Dismissible(
          onDismissed: (direction) {},
          onUpdate: (DismissUpdateDetails details) {
            final double offset = details.progress * constraints.maxWidth;
            if (offset >= 72) {
              _padding.value = offset - 72;
            }
          },
          confirmDismiss: (DismissDirection direction) async {
            callback();
            if (direction == DismissDirection.startToEnd) {
              updateDone();
              return false;
            } else {
              final bool confirmed =
                  await Dialogs.showConfirmCloseCountDialog(context) ?? false;
              if (!mounted) {
                return true;
              }
              if (confirmed) {
                BlocProvider.of<TasksBloc>(context)
                    .add(DeleteTask(task: widget.task));
                return true;
              }
              return false;
            }
          },
          key: ValueKey(widget.task),
          background: TaskConfirmWidget(paddingNotifier: _padding),
          secondaryBackground: TaskDeleteWidget(paddingNotifier: _padding),
          child: TaskForeground(task: widget.task, updateDone: updateDone),
        );
      },
    );
  }
}
