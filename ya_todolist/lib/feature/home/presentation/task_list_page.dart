import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/common/widgets/responsive_widgets.dart';
import 'package:ya_todolist/feature/home/presentation/widgets/floating_button.dart';
import 'package:ya_todolist/feature/home/presentation/widgets/new_task_field.dart';

import '../../task/bloc/tasks_bloc.dart';
import 'widgets/loading_widget.dart';
import 'widgets/sliver_appbar.dart';
import 'widgets/task_list.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key, required this.onItemTap});

  final void Function(String? task) onItemTap;

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  //late ApiUtil apiUtil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.myColors!.backPrimary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final tabletCond =
                [constraints.maxHeight, constraints.maxWidth].reduce(max) > 900;
            return TabletPadding(
              condition: tabletCond,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            const MySliverAppBar(),
                            context.watch<TasksBloc>().state.when(
                                  initial: (_) => const LoadingWidget(),
                                  loaded: (myTasks, rep, sortingType, loaded) =>
                                      const MySliverList(),
                                ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, 8, 0, 0), //EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: NewTaskField(),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Center(
                            child: MyFloatingButton(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
