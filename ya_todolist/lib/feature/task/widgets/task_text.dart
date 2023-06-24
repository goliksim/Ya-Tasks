import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/common/utils.dart';

import '../domain/task_entitiy.dart';

class TaskText extends StatelessWidget {
  const TaskText({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.text,
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: myTextTheme.subtitle1!.copyWith(
            decoration:
                task.done ? TextDecoration.lineThrough : TextDecoration.none,
            color: !task.done
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.tertiary,
          ),
        ),
        if (task.deadline != null) const SizedBox(height: 4),
        if (task.deadline != null)
          Text(
            printDate(task.deadline),
            style: myTextTheme.headline3!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
      ],
    );
  }
}
