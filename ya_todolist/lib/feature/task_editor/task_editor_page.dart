import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/widgets/responsive_widgets.dart';
import 'package:ya_todolist/feature/task_editor/widgets/task_editor_appbar.dart';

import '../../common/theme_constants.dart';
import 'bloc/editor_bloc.dart';
import 'widgets/task_editor_column.dart';
import 'widgets/task_editor_textfield.dart';

class TaskEditorBuilder extends StatelessWidget {
  const TaskEditorBuilder({super.key, this.taskID});
  final String? taskID;

  @override
  Widget build(BuildContext context) {
    final editBloc = context.editBloc;

    editBloc!.add(EditorLoad(context: context, id: taskID));

    return BlocBuilder<EditorBloc, EditorState>(
      buildWhen: (previous, current) =>
          ((previous.task.changedAt != current.task.changedAt ||
                  previous is! EditorStateLoaded) &&
              current is EditorStateLoaded),
      builder: (context, state) {
        return TaskEditorPage(
            taskId: taskID, editMode: state.task.createdAt != null);
      },
    );
  }
}

class TaskEditorPage extends StatelessWidget {
  const TaskEditorPage({super.key, this.taskId, required this.editMode});
  final String? taskId;
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    final state = context.editState!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.myColors!.backPrimary,
      appBar: const EditorAppbar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final landscapeCond = constraints.maxWidth < constraints.maxHeight;
          final tabletCond =
              [constraints.maxHeight, constraints.maxWidth].reduce(max) > 900;
          return TabletPadding(
            condition: tabletCond,
            child: EditorResponsiveBuilder(
              condition: landscapeCond,
              children: [
                EditorTextField(
                    controller: (state is EditorStateLoaded &&
                            ((taskId ?? '') == state.task.id))
                        ? state.controller
                        : TextEditingController(text: ' '),
                    condition: landscapeCond),
                EditorColumn(editMode: editMode),
              ],
            ),
          );
        },
      ),
    );
  }
}
