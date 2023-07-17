import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../data/domain/task_model.dart';

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
          style: MyTheme.myTextTheme.titleMedium!.copyWith(
            decoration:
                task.done ? TextDecoration.lineThrough : TextDecoration.none,
            color: !task.done
                ? context.myColors!.labelPrimary
                : context.myColors!.tertiary,
          ),
        ),
        if (task.deadline != null) const SizedBox(height: 4),
        if (task.deadline != null)
          Text(
            DateFormat.yMMMMd(AppLocalizations.of(context).localeName)
                .format(task.deadline!), //date
            style: MyTheme.myTextTheme.displaySmall!
                .copyWith(color: context.myColors!.tertiary),
          ),
      ],
    );
  }
}
