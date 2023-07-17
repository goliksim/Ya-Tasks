import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../task/bloc/tasks_bloc.dart';

class NewTaskField extends StatefulWidget {
  const NewTaskField({super.key});
  @override
  State<NewTaskField> createState() => _NewTaskFieldState();
}

class _NewTaskFieldState extends State<NewTaskField> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.topLeft,
      color: context.myColors!.backSecondary,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        style: MyTheme.myTextTheme.titleMedium!
            .copyWith(color: context.myColors!.labelPrimary),
        onSubmitted: (value) {
          if (value != '') {
            context.read<TasksBloc>().add(
                  AddTask(
                    task: Task(
                      text: value,
                      createdAt: DateTime.now(),
                      changedAt: DateTime.now(),
                    ),
                  ),
                );
            controller.text = '';
          }
        },
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(52, 12, 52, 12),
          border: InputBorder.none,
          hintText: AppLocalizations.of(context).newTaskField,
          hintStyle: MyTheme.myTextTheme.titleMedium!
              .copyWith(color: context.myColors!.tertiary),
        ),
      ),
    );
  }
}
