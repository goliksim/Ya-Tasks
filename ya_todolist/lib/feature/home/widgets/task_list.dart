import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/task_widget.dart';

import 'new_task_field.dart';

class MySliverList extends StatefulWidget {
  const MySliverList({super.key});

  @override
  State<MySliverList> createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final tasks = state.myTasks.where((e) => !e.deleted).toList();
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
                      AnimatedList(
                        //buildDefaultDragHandles: false,
                        //reverse: true,
                        key: _key,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        initialItemCount : tasks.length,
                        itemBuilder: (context, index, animation) {

                          return SizeTransition(
                            sizeFactor: animation,
                            child: !(state.hideDone && tasks[index].done)
                                ? TaskWidget(
                                    key: ValueKey(tasks[index].id),
                                    task: tasks[index],
                                  )
                                : SizedBox(
                                    key: Key('$index'),
                                  ),
                          );
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
