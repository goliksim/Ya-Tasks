import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/app/di.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/common/routes/router_delegate.dart';
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
    await state.rep.syncStoragesV2();

    final finalList = await state.rep.getTasks();

    emit(
      TasksStateLoading(
          hideDone: state.hideDone,
          myTasks: finalList!,
          //apiUtil: state.apiUtil,
          rep: state.rep,
          routerDelegate: state.routerDelegate),
    );
    Logs.logIns.writeLog('Load tasks to bloc:\n${finalList.join('\n')}');
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
    Logs.logIns.writeLog('Insert task: ${event.task}');
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
      TasksState(
        hideDone: state.hideDone,
        myTasks: updatedTasks,
        //apiUtil: state.apiUtil,
        rep: state.rep,
        routerDelegate: state.routerDelegate,
        loaded: true,
      ),
    );

    await state.rep.addTask(newTask);
    try {
      Locator.analytics.logEvent(name: 'task_added', parameters: {
        'text_len': event.task.text.length.toString(),
        'imp_type': event.task.importance.name,
        'deadline': (event.task.deadline != null).toString(),
        'deadline_offset': (event.task.deadline != null)
            ? event.task.deadline!.difference(DateTime.now()).inDays.toString()
            : 'none'
      }).then((_) {
        Logs.logIns.writeLog('Logged task_added to firebase');
      });
    } catch (e) {
      Logs.logIns.writeLog('Doesnt init Firebase');
    }

    Logs.logIns.writeLog('Task added: $newTask');
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
      TasksState(
        hideDone: state.hideDone,
        myTasks: updatedTasks,
        //apiUtil: state.apiUtil,
        rep: state.rep,
        routerDelegate: state.routerDelegate,
        loaded: true,
      ),
    );
    await state.rep.updateTask(newTask);
    Logs.logIns.writeLog('Task updated: $newTask');
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    bool deletedNet = await state.rep.deleteTask(event.task.id.toString());

    List<Task> updatedTasks = state.myTasks;
    if (deletedNet) {
      Logs.logIns.writeLog('Delete task forever: ${event.task}');
      updatedTasks =
          state.myTasks.where((task) => task.id != event.task.id).toList();
    } else {
      Logs.logIns.writeLog('Network Error. Move to trash: ${event.task}');
      final trashTask = event.task.copyWith(deleted: true);
      updatedTasks = List<Task>.from(state.myTasks).map((task) {
        return task.id == event.task.id ? trashTask : task;
      }).toList();
      await state.rep.updateTask(trashTask);
    }

    emit(
      TasksState(
        hideDone: state.hideDone,
        myTasks: updatedTasks,
        //apiUtil: state.apiUtil,
        rep: state.rep,
        routerDelegate: state.routerDelegate,
        loaded: true,
      ),
    );
    try {
      Locator.analytics.logEvent(name: 'task_deleted', parameters: {
        'was_done': event.task.done.toString(),
      });
    } catch (e) {
      Logs.logIns.writeLog('Doesnt init Firebase');
    }
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
    Logs.logIns.writeLog(
        'Done filter: completed myTasks ${!state.hideDone ? 'show' : 'unshow'}');
  }
}
