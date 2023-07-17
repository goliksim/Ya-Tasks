import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/common/widgets/tablet_padding.dart';
import 'package:ya_todolist/feature/home/widgets/floating_button.dart';

import '../task/bloc/tasks_bloc.dart';
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
                [constraints.maxHeight, constraints.maxWidth].reduce(max) > 800;
            return tabletPadding(
              condition: tabletCond,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const MySliverAppBar(),
                  context.taskState!.loaded
                      ? const MySliverList()
                      : const LoadingWidget(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
