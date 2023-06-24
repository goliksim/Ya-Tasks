import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/feature/task/data/storage/storage.dart';
import '../../task_editor/task_editor_page.dart';
import '../domain/task_entitiy.dart';

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
          logs.writeLog('TO EDIT -> ${task.show()}');

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  TaskEditorPage(thisTask: task.copyWith(), editMode: true),
            ),
          );
        },
        icon: Icon(
          Icons.info_outline,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
