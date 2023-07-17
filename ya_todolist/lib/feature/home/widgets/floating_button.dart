import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        BlocProvider.of<TasksBloc>(context)
            .state
            .routerDelegate
            .showTaskEditor(null);
      },
      tooltip: AppLocalizations.of(context).addTask,
      child: const Icon(Icons.add),
    );
  }
}
