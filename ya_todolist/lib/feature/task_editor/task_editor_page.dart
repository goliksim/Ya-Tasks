import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/domain/task_entitiy.dart';
import 'package:ya_todolist/feature/task_editor/widgets/task_editor_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/theme_constants.dart';
import 'bloc/editor_bloc.dart';
import 'bloc/editor_state.dart';
import 'widgets/task_editor_deadline.dart';
import 'widgets/task_editor_textfield.dart';
import 'widgets/task_priority_changer.dart';

class TaskEditorPage extends StatefulWidget {
  const TaskEditorPage(
      {super.key, required this.thisTask, required this.editMode});
  final Task thisTask;
  final bool editMode;

  @override
  State<TaskEditorPage> createState() => _TaskEditorPageState();
}

class _TaskEditorPageState extends State<TaskEditorPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.value = TextEditingValue(text: widget.thisTask.text);
    super.initState();
  }

  void saveTask(BuildContext context) {
    Task tempTask = BlocProvider.of<EditorBloc>(context)
        .state
        .task
        .copyWith(text: controller.text);
    if (tempTask.text.isNotEmpty) {
      if (widget.editMode == true) {
        BlocProvider.of<TasksBloc>(context).add(UpdateTask(
            task:
                tempTask)); //widget.thisTask.copyWith(text: controller.text, priority: dropdownvalue, deadlineDate: deadlineDate)
      } else {
        BlocProvider.of<TasksBloc>(context).add(AddTask(task: tempTask));
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc(currentTask: widget.thisTask),
      child: BlocBuilder<EditorBloc, EditorState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.background,
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
                        color: Theme.of(context).colorScheme.outline,
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
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: (widget.editMode)
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.tertiary,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (widget.editMode) {
                      context
                          .read<TasksBloc>()
                          .add(DeleteTask(task: widget.thisTask));
                      Navigator.of(context).pop();
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
                            color: (widget.editMode)
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).colorScheme.tertiary,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            AppLocalizations.of(context).delete,
                            style: myTextTheme.subtitle1!.copyWith(
                              color: (widget.editMode)
                                  ? Theme.of(context).colorScheme.error
                                  : Theme.of(context).colorScheme.tertiary,
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
