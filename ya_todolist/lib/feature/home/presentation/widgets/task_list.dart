import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/home/models/sorting_model.dart';
import 'package:ya_todolist/feature/home/utils/listview_sorting.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';
import 'package:ya_todolist/feature/task/presentation/task_widget.dart';

class MySliverList extends StatefulWidget {
  const MySliverList({super.key});

  @override
  State<MySliverList> createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  List<Task> getSortedList(List<Task> tasks, SortingType sortingType) {
    switch (sortingType.type) {
      case SortType.deadline:
        return sortByDeadline(tasks, sortingType.isAscending);
      case SortType.changedAt:
        return sortByChangedAt(tasks, sortingType.isAscending);
      case SortType.createdAt:
        return sortByCreatedAt(tasks, sortingType.isAscending);
      case SortType.importance:
        return sortByiImportance(tasks, sortingType.isAscending);
      case SortType.done:
        return sortByDone(tasks, sortingType.isAscending);
      case SortType.text:
        return sortByText(tasks, sortingType.isAscending);
      default:
        return sortByChangedAt(tasks, true);
    }
  }

  List<Task> hiveDoneTasks(List<Task> tasks, bool hideDone) {
    return tasks.where((e) => !e.done || !hideDone).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        state as TasksStateLoaded;
        //TASKS FILTERING AND SORTING
        List<Task> tasks = state.myTasks.where((e) => !e.deleted).toList();
        tasks = getSortedList(tasks, state.sortingType);
        tasks = hiveDoneTasks(tasks, state.sortingType.hideDone);

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
                    ListView.separated(
                      //buildDefaultDragHandles: false,
                      key: _key,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskWidget(
                          key: ValueKey(tasks[index].id),
                          task: tasks[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
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
