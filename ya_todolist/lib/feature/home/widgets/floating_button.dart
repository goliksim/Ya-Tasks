import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../task/domain/task_entitiy.dart';
import '../../task_editor/task_editor_page.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TaskEditorPage(thisTask: Task(), editMode: false),
          ),
        );
      },
      tooltip: AppLocalizations.of(context).addTask,
      child: const Icon(Icons.add),
    );
  }
}
