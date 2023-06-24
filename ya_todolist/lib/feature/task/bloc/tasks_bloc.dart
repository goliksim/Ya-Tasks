import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/data/storage/storage.dart';

import '../data/api/api_util.dart';
import '../domain/task_entitiy.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(TasksState(
            hideDone: true,
            myTasks: const <Task>[],
            loaded: false,
            apiUtil: ApiUtil())) {
    on<LoadTasks>(_loadTasks);
    on<AddTask>(_addTask);
    on<InsertTask>(_insertTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<DoneFilter>(_doneFilter);
  }

  Future<void> _loadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    emit(
      TasksState(
          hideDone: state.hideDone,
          myTasks: event.tasks,
          loaded: true,
          apiUtil: event.apiUtil),
    );
    logs.writeLog('Load tasks: ${event.tasks.join('\n')}');
  }

  Future<void> _insertTask(InsertTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks)
      ..insert(event.index, event.task);
    emit(
      TasksState(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          loaded: state.loaded,
          apiUtil: state.apiUtil),
    );
    logs.writeLog('Insert task: ${event.task}');
    state.apiUtil.patchData(updatedTasks);
    tasksStorage.writeTasks(updatedTasks, state.apiUtil.revVersion + 1);
  }

  Future<void> _addTask(AddTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks)..add(event.task);
    emit(
      TasksState(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          loaded: state.loaded,
          apiUtil: state.apiUtil),
    );
    logs.writeLog('Add task: ${event.task}');
    state.apiUtil.patchData(updatedTasks);
    tasksStorage.writeTasks(updatedTasks, state.apiUtil.revVersion + 1);
  }

  Future<void> _updateTask(UpdateTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks).map((task) {
      return task.id == event.task.id ? event.task : task;
    }).toList();
    //print(updatedTasks);
    emit(
      TasksState(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          loaded: state.loaded,
          apiUtil: state.apiUtil),
    );
    logs.writeLog('Update task: ${event.task}');
    state.apiUtil.patchData(updatedTasks);
    tasksStorage.writeTasks(updatedTasks, state.apiUtil.revVersion + 1);
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final updatedTasks =
        state.myTasks.where((task) => task.id != event.task.id).toList();
    emit(
      TasksState(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          loaded: state.loaded,
          apiUtil: state.apiUtil),
    );
    logs.writeLog('Delete task: ${event.task}');
    state.apiUtil.patchData(updatedTasks);
    tasksStorage.writeTasks(updatedTasks, state.apiUtil.revVersion + 1);
  }

  Future<void> _doneFilter(DoneFilter event, Emitter<TasksState> emit) async {
    emit(
      TasksState(
          hideDone: !state.hideDone,
          myTasks: state.myTasks,
          loaded: state.loaded,
          apiUtil: state.apiUtil),
    );
    logs.writeLog(
        'Done filter: completed myTasks ${!state.hideDone ? 'show' : 'unshow'}');
  }
}
