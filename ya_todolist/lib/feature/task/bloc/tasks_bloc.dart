import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/common/routes/router_delegate.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';
import '../domain/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required routerDelegate, required repository})
      : super(TasksState(
            hideDone: true,
            myTasks: const <Task>[],
            loaded: false,
            rep: repository,
            routerDelegate: routerDelegate)) {
    on<LoadTasks>(_loadTasks);
    on<AddTask>(_addTask);
    on<InsertTask>(_insertTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<DoneFilter>(_doneFilter);
  }

  Future<void> _loadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    await state.rep.init();
    await state.rep.syncStorages();

    final finalList = await state.rep.getTasks();
    /*ApiUtil apiUtil = state.apiUtil;
    //Получаем ревизию сервера
    int apiRev = await apiUtil.networkManager.getRevision();
    //Получаем ревизию локального хранилища
    int storageRev = await tasksStorage.readRev();

    List<Task> finalList = [];
    if (apiRev > storageRev) {
      Logs.logImpl.writeLog('LOAD FROM API ${state.loaded}');
      finalList = await apiUtil.getTaskList();
    } else {
      Logs.logImpl.writeLog('LOAD FROM STORAGE');
      if (apiRev != 0) {
        storageRev = apiRev;
        tasksStorage.writeRev(storageRev);
      }
      finalList = await tasksStorage.readTasks();
    }*/

    emit(
      TasksStateLoading(
          hideDone: state.hideDone,
          myTasks: finalList!,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logImpl.writeLog('Load tasks to bloc: ${finalList.join('\n')}');
  }

  Future<void> _insertTask(InsertTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks)
      ..insert(event.index, event.task);
    emit(
      TasksStateUpdate(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logImpl.writeLog('Insert task: ${event.task}');
  }

  Future<void> _addTask(AddTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks)..add(event.task);
    emit(
      TasksStateUpdate(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logImpl.writeLog('Add task: ${event.task}');
  }

  Future<void> _updateTask(UpdateTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks).map((task) {
      return task.id == event.task.id ? event.task : task;
    }).toList();
    //print(updatedTasks);
    emit(
      TasksStateUpdate(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logImpl.writeLog('Update task: ${event.task}');
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final updatedTasks =
        state.myTasks.where((task) => task.id != event.task.id).toList();
    emit(
      TasksStateUpdate(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logImpl.writeLog('Delete task: ${event.task}');
  }

  Future<void> _doneFilter(DoneFilter event, Emitter<TasksState> emit) async {
    emit(
      TasksState(
          hideDone: !state.hideDone,
          myTasks: state.myTasks,
          loaded: state.loaded,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logImpl.writeLog(
        'Done filter: completed myTasks ${!state.hideDone ? 'show' : 'unshow'}');
  }
}
