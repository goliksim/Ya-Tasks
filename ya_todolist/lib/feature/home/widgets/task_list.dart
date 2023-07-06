import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/domain/task_model.dart';
import 'package:ya_todolist/feature/task/task_widget.dart';

import 'new_task_field.dart';

class MySliverList extends StatefulWidget {
  const MySliverList({super.key});

  @override
  State<MySliverList> createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final tasks = state.myTasks;
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Material(
              elevation: 2,
              color: context.myColors!.backSecondary,
              borderRadius: BorderRadius.circular(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      ReorderableListView.builder(
                        //buildDefaultDragHandles: false,
                        //reverse: true,
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          //get
                          Task item = tasks[oldIndex];
                          //delete & insert
                          context.read<TasksBloc>()
                            ..add(DeleteTask(task: item))
                            ..add(InsertTask(index: newIndex, task: item));
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return !(state.hideDone && tasks[index].done)
                              ? TaskWidget(
                                  key: ValueKey(tasks[index]),
                                  task: tasks[index],
                                )
                              : SizedBox(key: Key('$index'));
                        },
                      ),
                      const NewTaskField(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
