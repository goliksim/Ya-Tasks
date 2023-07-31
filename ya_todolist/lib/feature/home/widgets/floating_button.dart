import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/common/routes/navigator_inherited.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        NavigationInherited.of(context).routerDelegate.showTaskEditor(null);
      },
      tooltip: AppLocalizations.of(context).addTask,
      child: const Icon(Icons.add),
    );
  }
}
