// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/app/analytics.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';
import 'package:ya_todolist/feature/task_editor/bloc/editor_bloc.dart';
import '../data/domain/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_bloc.freezed.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

extension TaskBuilder on BuildContext {
  TasksState? get taskState => BlocProvider.of<TasksBloc>(this).state;
  TasksBloc? get taskBloc => BlocProvider.of<TasksBloc>(this);
}

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final EditorBloc editorBloc;
  late StreamSubscription streamSubscription;

  TasksBloc({required this.editorBloc, required repository})
      : super(TasksState.initial(rep: repository)) {
    streamSubscription = editorBloc.stream.listen((state) {
      print(state.runtimeType);
      if (state is EditorStateSaveNew) {
        add(AddTask(task: state.task));
      }
      if (state is EditorStateSaveOld) {
        add(UpdateTask(task: state.task));
      }
      if (state is EditorStateRemover) {
        add(DeleteTask(task: state.task));
      }
    });

    on<LoadTasks>(_loadTasks);
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<DoneFilter>(_doneFilter);
    //on<InsertTask>(_insertTask);
  }

  Future<void> _loadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    final initialState = state as TasksStateInitial;
    await initialState.rep.init();
    await initialState.rep.syncStorages();
    final finalList = await initialState.rep.getTasks();
    emit(
      TasksState.loaded(
        myTasks: finalList!,
        hideDone: true,
        loaded: true,
        rep: initialState.rep,
      ),
    );
    Logs.logg(
        'TasksBloc: loaded ${finalList.length} tasks to bloc -\n${finalList.length < 3 ? finalList.join('\n') : "${finalList.first}\n...\n${finalList.last}"}');
  }

  Future<void> _addTask(AddTask event, Emitter<TasksState> emit) async {
    if (state is TasksStateLoaded) {
      final current = state as TasksStateLoaded;
      final newTask = event.task.copyWith(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        changedAt: DateTime.now(),
        lastUpdatedBy: current.rep.localStorage.userId!,
      );
      final updatedTasks = List<Task>.from(current.myTasks)..add(newTask);
      emit(
        current.copyWith(
          myTasks: updatedTasks,
        ),
      );

      await current.rep.addTask(newTask);
      Analytics.logEvent('task_added', newTask);
      Logs.fine('TasksBloc: task added - $newTask');
    }
  }

  Future<void> _updateTask(UpdateTask event, Emitter<TasksState> emit) async {
    if (state is TasksStateLoaded) {
      final current = state as TasksStateLoaded;
      final newTask = event.task.copyWith(
        changedAt: DateTime.now(),
        lastUpdatedBy: current.rep.localStorage.userId!,
      );
      final updatedTasks = List<Task>.from(current.myTasks).map((task) {
        return task.id == event.task.id ? newTask : task;
      }).toList();
      emit(
        current.copyWith(
          myTasks: updatedTasks,
        ),
      );

      await current.rep.updateTask(newTask);
      Logs.fine('TasksBloc: Task updated: $newTask');
    }
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    if (state is TasksStateLoaded) {
      final current = state as TasksStateLoaded;
      bool deletedNet = await current.rep.deleteTask(event.task.id.toString());
      List<Task> updatedTasks = current.myTasks;
      if (deletedNet) {
        Logs.fine('TasksBloc: delete task forever - ${event.task}');
        updatedTasks =
            current.myTasks.where((task) => task.id != event.task.id).toList();
      } else {
        Logs.warning('TasksBloc: Network Error, move to trash - ${event.task}');
        final trashTask = event.task.copyWith(deleted: true);
        updatedTasks = List<Task>.from(current.myTasks).map((task) {
          return task.id == event.task.id ? trashTask : task;
        }).toList();
        await current.rep.updateTask(trashTask);
      }
      emit(
        current.copyWith(
          myTasks: updatedTasks,
        ),
      );
      Analytics.logEvent('task_deleted', event.task);
    }
  }

  Future<void> _doneFilter(DoneFilter event, Emitter<TasksState> emit) async {
    if (state is TasksStateLoaded) {
      final current = state as TasksStateLoaded;
      emit(
        current.copyWith(
          hideDone: !current.hideDone,
        ),
      );
      Logs.logg(
          'TasksBloc: Done filter - completed myTasks is${!current.hideDone ? 'showing' : 'not showing'}');
    }
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
