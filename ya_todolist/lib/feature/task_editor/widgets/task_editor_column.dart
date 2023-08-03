import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task_editor/bloc/editor_bloc.dart';

import 'task_editor_deadline.dart';
import 'task_editor_delete.dart';
import 'task_priority_changer.dart';

class EditorColumn extends StatelessWidget {
  const EditorColumn({super.key, required this.editMode});
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            BlocBuilder<EditorBloc, EditorState>(
                buildWhen: (previous, current) =>
                    (previous.task.importance != current.task.importance &&
                        current is EditorStateLoaded),
                builder: (context, state) {
                  return PriorityChanger(dropdownvalue: state.task.importance);
                }),
            Divider(
              height: 0,
              thickness: 1,
              color: context.myColors!.separator,
            ),
            BlocBuilder<EditorBloc, EditorState>(
                buildWhen: (previous, current) =>
                    (previous.task.deadline != current.task.deadline &&
                        current is EditorStateLoaded),
                builder: (context, state) {
                  return DeadLineSwitch(
                    key: UniqueKey(),
                    deadlineDate: state.task.deadline,
                  );
                }),
            const SizedBox(height: 24),
            Divider(
              height: 0,
              thickness: 1,
              color: context.myColors!.separator,
            ),
            const SizedBox(height: 8),
            EditorDeleteButton(editMode: editMode),
          ],
        ),
      ),
    );
  }
}
