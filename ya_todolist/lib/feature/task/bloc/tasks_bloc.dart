// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/app/analytics.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/domain/repositories/repository.dart';
import 'package:ya_todolist/feature/task_editor/bloc/editor_bloc.dart';
import '../domain/models/task_entity.dart';
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
  late StreamSubscription editBlocSubscription;
  late StreamSubscription taskSubscription;

  TasksBloc({required this.editorBloc, required Repository repository})
      : super(TasksState.initial(rep: repository)) {
    editBlocSubscription = editorBloc.stream.listen(
      (state) {
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
      },
    );
    taskSubscription = repository.observeAll().listen((tasks) {
      print(tasks);
      add(LoadStreamTasks(tasks));
    });

    on<LoadTasks>(_loadTasks);
    on<LoadStreamTasks>(_loadStreamTasks);
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<DoneFilter>(_doneFilter);
    //on<InsertTask>(_insertTask);
  }

  Future<void> _loadStreamTasks(
      LoadStreamTasks event, Emitter<TasksState> emit) async {
    final finalList = event.tasks;
    emit(
      TasksState.loaded(
        myTasks: finalList,
        hideDone: true,
        loaded: true,
        rep: state.rep,
      ),
    );
    Logs.logg(
        'TasksBloc: loaded from stream ${finalList.length} tasks to bloc -\n${finalList.length < 3 ? finalList.join('\n') : "${finalList.first}\n...\n${finalList.last}"}');
  }

  Future<void> _loadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    if (state is TasksStateInitial) {
      await state.rep.init();
    }

    if (state is TasksStateLoaded || state is TasksStateInitial) {
      await state.rep.syncStorages();
      final finalList = await state.rep.getTasks();
      emit(
        TasksState.loaded(
          myTasks: finalList!,
          hideDone: true,
          loaded: true,
          rep: state.rep,
        ),
      );
      Logs.logg(
          'TasksBloc: loaded ${finalList.length} tasks to bloc -\n${finalList.length < 3 ? finalList.join('\n') : "${finalList.first}\n...\n${finalList.last}"}');
    }
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

      await current.rep.addTask(newTask);
      //add(const LoadTasks());

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
      await current.rep.updateTask(newTask);
      //add(const LoadTasks());

      Logs.fine('TasksBloc: Task updated: $newTask');
    }
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    if (state is TasksStateLoaded) {
      final current = state as TasksStateLoaded;
      await current.rep.deleteTask(event.task.id.toString());

      //add(const LoadTasks());
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
}
