import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';

import '../bloc/tasks_bloc.dart';
import '../domain/task_model.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: Checkbox(
        fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.orange.withOpacity(.32);
          }
          return !task.done
              ? (task.importance == Importance.important
                  ? context.myColors!.red
                  : context.myColors!.separator)
              : context.myColors!.green;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        value: task.done,
        onChanged: ((_) {
          BlocProvider.of<TasksBloc>(context)
              .add(UpdateTask(task: task.copyWith(done: !task.done)));
        }),
      ),
    );
  }
}
