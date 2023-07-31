import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/app/analytics.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';
import '../data/domain/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

extension TaskBuilder on BuildContext {
  TasksState? get taskState => BlocProvider.of<TasksBloc>(this).state;
  TasksBloc? get taskBloc => BlocProvider.of<TasksBloc>(this);
}

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required routerDelegate, required repository})
      : super(TasksState(
            hideDone: true,
            myTasks: const <Task>[],
            loaded: false,
            rep: repository)) {
    on<LoadTasks>(_loadTasks);
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<DoneTask>(_doneTask);
    on<DoneFilter>(_doneFilter);
    //on<InsertTask>(_insertTask);
  }

  Future<void> _loadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    await state.rep.init();
    await state.rep.syncStorages();
    final finalList = await state.rep.getTasks();
    emit(
      TasksStateLoading(
        hideDone: state.hideDone,
        myTasks: finalList!,
        rep: state.rep,
      ),
    );
    Logs.logg(
        'TasksBloc: loaded ${finalList.length} tasks to bloc -\n${finalList.length < 3 ? finalList.join('\n') : "${finalList.first}\n...\n${finalList.last}"}');
  }

  Future<void> _addTask(AddTask event, Emitter<TasksState> emit) async {
    final newTask = event.task.copyWith(
      id: const Uuid().v4(),
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: state.rep.localStorage.userId!,
    );
    final updatedTasks = List<Task>.from(state.myTasks)..add(newTask);
    emit(
      TasksStateLoaded(
        hideDone: state.hideDone,
        myTasks: updatedTasks,
        rep: state.rep,
      ),
    );
    await state.rep.addTask(newTask);
    Analytics.logEvent('task_added', newTask);
    Logs.fine('TasksBloc: task added - $newTask');
  }

  Future<void> _updateTask(UpdateTask event, Emitter<TasksState> emit) async {
    final newTask = event.task.copyWith(
      changedAt: DateTime.now(),
      lastUpdatedBy: state.rep.localStorage.userId!,
    );
    final updatedTasks = List<Task>.from(state.myTasks).map((task) {
      return task.id == event.task.id ? newTask : task;
    }).toList();
    emit(
      TasksStateLoaded(
        hideDone: state.hideDone,
        myTasks: updatedTasks,
        rep: state.rep,
      ),
    );
    await state.rep.updateTask(newTask);
    Logs.fine('TasksBloc: Task updated: $newTask');
  }

  Future<void> _doneTask(DoneTask event, Emitter<TasksState> emit) async {
    final newTask = event.task.copyWith(
      changedAt: DateTime.now(),
      lastUpdatedBy: state.rep.localStorage.userId!,
    );

    await state.rep.updateTask(newTask);
    Logs.fine('TasksBloc: Task updated: $newTask');
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    bool deletedNet = await state.rep.deleteTask(event.task.id.toString());
    List<Task> updatedTasks = state.myTasks;
    if (deletedNet) {
      Logs.fine('TasksBloc: delete task forever - ${event.task}');
      updatedTasks =
          state.myTasks.where((task) => task.id != event.task.id).toList();
    } else {
      Logs.warning('TasksBloc: Network Error, move to trash - ${event.task}');
      final trashTask = event.task.copyWith(deleted: true);
      updatedTasks = List<Task>.from(state.myTasks).map((task) {
        return task.id == event.task.id ? trashTask : task;
      }).toList();
      await state.rep.updateTask(trashTask);
    }
    emit(
      TasksStateLoaded(
        hideDone: state.hideDone,
        myTasks: updatedTasks,
        rep: state.rep,
      ),
    );
    Analytics.logEvent('task_deleted', event.task);
  }

  Future<void> _doneFilter(DoneFilter event, Emitter<TasksState> emit) async {
    emit(
      TasksState(
        hideDone: !state.hideDone,
        myTasks: state.myTasks,
        loaded: state.loaded,
        rep: state.rep,
      ),
    );
    Logs.logg(
        'TasksBloc: Done filter - completed myTasks is${!state.hideDone ? 'showing' : 'not showing'}');
  }

  /*Future<void> _insertTask(InsertTask event, Emitter<TasksState> emit) async {
    final updatedTasks = List<Task>.from(state.myTasks)
      ..insert(event.index, event.task);
    emit(
      TasksStateUpdate(
          hideDone: state.hideDone,
          myTasks: updatedTasks,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logg('TasksBloc: insert task - ${event.task}');
  }*/
}
