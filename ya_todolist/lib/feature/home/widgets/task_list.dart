import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/task_widget.dart';

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
        state as TasksStateLoaded;
        final tasks = state.myTasks.where((e) => !e.deleted).toList();
        //From end to start
        final len = tasks.length - 1;
        return SliverToBoxAdapter(
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
                      initialItemCount: tasks.length,
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: !(state.hideDone && tasks[len - index].done)
                              ? TaskWidget(
                                  key: ValueKey(tasks[len - index].id),
                                  task: tasks[len - index],
                                )
                              : SizedBox(
                                  key: Key('${len - index}'),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
