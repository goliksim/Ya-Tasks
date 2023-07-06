import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
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
        child: CustomScrollView(
          slivers: [
            const MySliverAppBar(),
            BlocProvider.of<TasksBloc>(context).state.loaded
                ? const MySliverList()
                : const LoadingWidget(),
          ],
        ),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
