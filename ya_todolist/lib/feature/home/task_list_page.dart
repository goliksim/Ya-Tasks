import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/home/widgets/floating_button.dart';
import 'package:ya_todolist/feature/task/data/storage/storage.dart';

import '../task/bloc/tasks_bloc.dart';
import '../task/data/api/api_util.dart';
import 'widgets/loading_widget.dart';
import 'widgets/sliver_appbar.dart';
import 'widgets/task_list.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late ApiUtil apiUtil;

  @override
  void initState() {
    super.initState();
    loading(context);
  }

  Future loading(BuildContext context) async {
    apiUtil = ApiUtil();
    //Получаем ревизию сервера
    int apiRev = await apiUtil.networkManager.getRevision();
    //Получаем ревизию локального хранилища
    int storageRev = await tasksStorage.readRev();
    if (apiRev > storageRev) {
      logs.writeLog('LOAD FROM API');
      apiUtil.getTaskList().then((value) {
        BlocProvider.of<TasksBloc>(context)
            .add(LoadTasks(tasks: value, apiUtil: apiUtil.copyWith(apiRev)));
      });
    } else {
      logs.writeLog('LOAD FROM STORAGE');
      if (apiRev != 0) {
        storageRev = apiRev;
        tasksStorage.writeRev(storageRev);
      }
      tasksStorage.readTasks().then((value) =>
          BlocProvider.of<TasksBloc>(context).add(
              LoadTasks(tasks: value, apiUtil: apiUtil.copyWith(storageRev))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const MySliverAppBar(),
                state.loaded ? const MySliverList() : const LoadingWidget(),
              ],
            ),
          ),
          floatingActionButton: const MyFloatingButton(),
        );
      },
    );
  }
}
