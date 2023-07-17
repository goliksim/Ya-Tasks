import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/widgets/tablet_padding.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task_editor/widgets/task_editor_appbar.dart';

import '../../common/theme_constants.dart';
import 'bloc/editor_bloc.dart';
import 'bloc/editor_state.dart';
import 'widgets/task_editor_deadline.dart';
import 'widgets/task_editor_delete.dart';
import 'widgets/task_editor_textfield.dart';
import 'widgets/task_priority_changer.dart';

class TaskEditorPage extends StatefulWidget {
  const TaskEditorPage({super.key, this.taskID});
  final String? taskID;

  @override
  State<TaskEditorPage> createState() => _TaskEditorPageState();
}

class _TaskEditorPageState extends State<TaskEditorPage> {
  final TextEditingController controller = TextEditingController();
  Task thisTask = Task(createdAt: DateTime.now(), changedAt: DateTime.now());
  bool editMode = false;

  void waitTasks(BuildContext context) async {
    final state = context.taskState!;
    if (!state.loaded) {
      await Future.doWhile(() async {
        bool loading = !state.loaded;
        await Future.delayed(const Duration(milliseconds: 500));
        return loading;
      });
    }
    if (!mounted) {
      return;
    }
    if (widget.taskID != null) {
      setState(() {
        if (state.myTasks.any((e) => e.id == widget.taskID && !e.deleted)) {
          thisTask = state.myTasks.where((e) => e.id == widget.taskID).first;
          editMode = true;
        }
        controller.value = TextEditingValue(text: thisTask.text);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    waitTasks(context);
  }

  void saveTask(BuildContext context) {
    Task tempTask = context.editState!.task.copyWith(text: controller.text);
    if (tempTask.text.isNotEmpty) {
      if (editMode == true) {
        BlocProvider.of<TasksBloc>(context).add(
          UpdateTask(task: tempTask),
        ); //thisTask.copyWith(text: controller.text, priority: dropdownvalue, deadlineDate: deadlineDate)
      } else {
        BlocProvider.of<TasksBloc>(context).add(AddTask(task: tempTask));
      }
      context.taskState!.routerDelegate.popRoute(); //pop
    }
  }

  void deleteTask(BuildContext context) {
    if (editMode) {
      context.read<TasksBloc>().add(DeleteTask(task: thisTask));
      BlocProvider.of<TasksBloc>(context).state.routerDelegate.popRoute(); //pop
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => EditorBloc(currentTask: thisTask),
      child: BlocBuilder<EditorBloc, EditorState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: context.myColors!.backPrimary,
            appBar: EditorAppbar(saveTask: saveTask),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final landscapeCond =
                    constraints.maxWidth < constraints.maxHeight;
                final tabletCond =
                    [constraints.maxHeight, constraints.maxWidth].reduce(max) >
                        800;
                return tabletPadding(
                  condition: tabletCond,
                  child: myEditorBuilder(
                    condition: landscapeCond,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                          child: EditorTextField(
                              controller: controller,
                              condition: landscapeCond)),
                      Column(
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
                              deleteTask: deleteTask, editMode: editMode),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Widget myEditorBuilder(
    {required List<Widget> children, required bool condition}) {
  if (condition) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start, children: children),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
          verticalDirection: VerticalDirection.down,
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children.reversed
              .map((e) => Expanded(
                    child: e,
                  ))
              .toList()),
    );
  }
}

/*[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: EditorTextField(controller: controller)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          PriorityChanger(dropdownvalue: state.task.importance),
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
                        deleteTask: deleteTask, editMode: editMode),
                  ] */
