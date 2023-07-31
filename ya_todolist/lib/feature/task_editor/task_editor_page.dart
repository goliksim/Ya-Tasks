import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/routes/navigator_inherited.dart';
import 'package:ya_todolist/common/widgets/responsive_widgets.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task_editor/widgets/task_editor_appbar.dart';

import '../../common/theme_constants.dart';
import 'bloc/editor_bloc.dart';
import 'bloc/editor_events.dart';
import 'bloc/editor_state.dart';
import 'widgets/task_editor_deadline.dart';
import 'widgets/task_editor_delete.dart';
import 'widgets/task_editor_textfield.dart';
import 'widgets/task_priority_changer.dart';

class TaskEditorBuilder extends StatelessWidget {
  const TaskEditorBuilder({super.key, this.taskID});
  final String? taskID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => EditorBloc(
          currentTask:
              Task(createdAt: DateTime.now(), changedAt: DateTime.now()),
          editMode: taskID != null),
      child: BlocBuilder<EditorBloc, EditorState>(
        builder: (context, state) {
          return TaskEditorPage(taskID: taskID);
        },
      ),
    );
  }
}

class TaskEditorPage extends StatefulWidget {
  const TaskEditorPage({super.key, this.taskID});
  final String? taskID;

  @override
  State<TaskEditorPage> createState() => _TaskEditorPageState();
}

class _TaskEditorPageState extends State<TaskEditorPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EditorBloc>(context)
        .add(EditorLoad(context: context, id: widget.taskID));
  }

  void saveTask(BuildContext context) {
    final state = context.editState!;
    Task tempTask = state.task.copyWith(text: state.textController.text);
    if (tempTask.text.isNotEmpty) {
      if (state.editMode == true) {
        BlocProvider.of<TasksBloc>(context).add(
          UpdateTask(task: tempTask),
        );
      } else {
        BlocProvider.of<TasksBloc>(context).add(AddTask(task: tempTask));
      }
      NavigationInherited.of(context).routerDelegate.popRoute(); //pop
    }
  }

  void deleteTask(BuildContext context) {
    final state = context.editState!;
    if (state.editMode) {
      context.read<TasksBloc>().add(DeleteTask(task: context.editState!.task));
      NavigationInherited.of(context).routerDelegate.popRoute(); //pop
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.editState!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.myColors!.backPrimary,
      appBar: EditorAppbar(saveTask: saveTask),
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
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: EditorTextField(
                        controller: state.textController,
                        condition: landscapeCond)),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: landscapeCond ? 16 : 0),
                        child: Column(
                          children: [
                            PriorityChanger(
                                dropdownvalue: state.task.importance),
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: context.myColors!.separator,
                            ),
                            DeadLineSwitch(
                              deadlineDate: state.task.deadline,
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0,
                        thickness: 1,
                        color: context.myColors!.separator,
                      ),
                      const SizedBox(height: 8),
                      EditorDeleteButton(
                          deleteTask: deleteTask, editMode: state.editMode),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


