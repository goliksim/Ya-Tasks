import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import '../data/domain/task_model.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({super.key, required this.task, required this.updateDone});
  final Task task;
  final void Function() updateDone;
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
                  ? context.myColors!.priority
                  : context.myColors!.separator)
              : context.myColors!.green;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        value: task.done,
        onChanged: ((_) => updateDone()),
      ),
    );
  }
}
