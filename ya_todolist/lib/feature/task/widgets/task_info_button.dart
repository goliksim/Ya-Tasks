import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import '../domain/task_model.dart';

class TaskInfoButton extends StatelessWidget {
  const TaskInfoButton({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: IconButton(
        tooltip: AppLocalizations.of(context).editButton,
        splashRadius: 1,
        padding: EdgeInsets.zero,
        onPressed: () {
          BlocProvider.of<TasksBloc>(context)
              .state
              .routerDelegate
              .showTaskEditor(task.id);
        },
        icon: Icon(
          Icons.info_outline,
          color: context.myColors!.tertiary,
        ),
      ),
    );
  }
}
