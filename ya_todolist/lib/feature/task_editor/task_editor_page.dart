import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/domain/task_model.dart';
import 'package:ya_todolist/feature/task_editor/widgets/task_editor_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/logger.dart';
import '../../common/theme_constants.dart';
import 'bloc/editor_bloc.dart';
import 'bloc/editor_state.dart';
import 'widgets/task_editor_deadline.dart';
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
  Task thisTask = Task();
  bool editMode = false;

  void waitTasks(BuildContext context) async {
    if (!BlocProvider.of<TasksBloc>(context).state.loaded) {
      await Future.doWhile(() async {
        bool loading = !BlocProvider.of<TasksBloc>(context).state.loaded;
        await Future.delayed(const Duration(milliseconds: 500));
        return loading;
      });
    }
    if (!mounted) {
      //Logs.logImpl.writeLog('Mounted in Editor');
      return;
    }
    if (widget.taskID != null) {
      if (BlocProvider.of<TasksBloc>(context)
          .state
          .myTasks
          .any((e) => e.id == widget.taskID)) {
        thisTask = BlocProvider.of<TasksBloc>(context)
            .state
            .myTasks
            .where((e) => e.id == widget.taskID)
            .first;
        //BlocProvider.of<EditorBloc>(context).add(EditorUpdatePriority(priority: thisTask.importance));
        //BlocProvider.of<EditorBloc>(context).add(EditorUpdateDeadline(deadline: thisTask.deadline!));

        editMode = true;
      }
      setState(() {
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
    Task tempTask = BlocProvider.of<EditorBloc>(context)
        .state
        .task
        .copyWith(text: controller.text);
    if (tempTask.text.isNotEmpty) {
      if (editMode == true) {
        BlocProvider.of<TasksBloc>(context).add(UpdateTask(
            task:
                tempTask)); //thisTask.copyWith(text: controller.text, priority: dropdownvalue, deadlineDate: deadlineDate)
      } else {
        BlocProvider.of<TasksBloc>(context).add(AddTask(task: tempTask));
      }
      BlocProvider.of<TasksBloc>(context).state.routerDelegate.popRoute(); //pop
    }
  }

  @override
  Widget build(BuildContext context) {
    Logs.logImpl.writeLog('How often check $thisTask');
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => EditorBloc(currentTask: thisTask),
      child: BlocBuilder<EditorBloc, EditorState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: context.myColors!.backPrimary,
            appBar: EditorAppbar(saveTask: saveTask),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      EditorTextField(controller: controller),
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
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: (editMode)
                        ? context.myColors!.red
                        : context.myColors!.tertiary,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (editMode) {
                      context.read<TasksBloc>().add(DeleteTask(task: thisTask));
                      BlocProvider.of<TasksBloc>(context)
                          .state
                          .routerDelegate
                          .popRoute(); //pop
                    }
                  },
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.delete,
                            color: (editMode)
                                ? context.myColors!.red
                                : context.myColors!.tertiary,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            AppLocalizations.of(context).delete,
                            style: MyTheme.myTextTheme.subtitle1!.copyWith(
                              color: (editMode)
                                  ? context.myColors!.red
                                  : context.myColors!.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
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
