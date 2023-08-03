// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/routes/navigator_inherited.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/common/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'editor_bloc.freezed.dart';
part 'editor_events.dart';
part 'editor_state.dart';

extension TaskBuilder on BuildContext {
  EditorState? get editState => BlocProvider.of<EditorBloc>(this).state;
  EditorBloc? get editBloc => BlocProvider.of<EditorBloc>(this);
}

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc({bool editMode = false})
      : super(EditorState.initial(
          task: const Task(),
          controller: TextEditingController(),
        )) {
    on<EditorLoad>(_loadTask);
    on<EditorUpdatePriority>(_editorUpdatePriority);
    on<EditorUpdateDeadline>(_editorUpdateDeadline);
    on<EditorDeleteDeadline>(_editorDeleteDeadline);
    on<EditorSaver>(_editorSaver);
    on<EditorRemover>(_editorRemover);
    //on<EditorReset>(_editorReset);
  }

  /*Future<void> _editorReset(EditorReset event, Emitter<EditorState> emit) async {
    Logs.logg('EditorBloc: reset');
    emit(const EditorState.initial(task: Task()));
  }*/

  Future<void> _loadTask(EditorLoad event, Emitter<EditorState> emit) async {
    Logs.logg('EditorBloc: loading');
    final tasksState = event.context.taskState!;

    if (tasksState is! TasksStateLoaded) {
      await Future.doWhile(() async {
        bool loading = tasksState is! TasksStateLoaded;
        await Future.delayed(const Duration(milliseconds: 500));
        return loading;
      });
    }

    if (event.id != null) {
      tasksState as TasksStateLoaded;
      if (tasksState.myTasks.any((e) => e.id == event.id && !e.deleted)) {
        final task = tasksState.myTasks.where((e) => e.id == event.id).first;
        emit(
          EditorState.loaded(
              task: task, controller: TextEditingController(text: task.text)),
        );
        Logs.logg('EditorBloc: load task from storage: $task');
        return;
      }
      Logs.logg('EditorBloc: failed to load task from storage');
    }
    Logs.logg('EditorBloc: null ID');
    emit(
      EditorState.loaded(
        task: const Task(),
        controller: TextEditingController(),
      ),
    );
  }

  Future<void> _editorUpdatePriority(
      EditorUpdatePriority event, Emitter<EditorState> emit) async {
    if (state is EditorStateLoaded) {
      final current = state as EditorStateLoaded;
      emit(
        current.copyWith(
          task: current.task.copyWith(importance: event.priority),
        ),
      );
      Logs.logg('EditorBloc: update priority: ${event.priority}');
    }
  }

  Future<void> _editorUpdateDeadline(
      EditorUpdateDeadline event, Emitter<EditorState> emit) async {
    if (state is EditorStateLoaded) {
      final current = state as EditorStateLoaded;
      emit(
        current.copyWith(
          task: current.task.copyWith(deadline: event.deadline),
        ),
      );
      Logs.logg('EditorBloc: update deadlineDate: ${event.deadline}');
    }
  }

  Future<void> _editorDeleteDeadline(
      EditorDeleteDeadline event, Emitter<EditorState> emit) async {
    if (state is EditorStateLoaded) {
      final current = state as EditorStateLoaded;
      emit(
        current.copyWith(
          task: current.task.copyWith(deadline: null),
        ),
      );
      Logs.logg('EditorBloc: delete deadlineDate');
    }
  }

  Future<void> _editorSaver(
      EditorSaver event, Emitter<EditorState> emit) async {
    print('_mapEventToState');
    if (state is EditorStateLoaded) {
      final current = state as EditorStateLoaded;
      Task newTask = state.task.copyWith(text: current.controller.text);
      if (newTask.text.isNotEmpty) {
        if (current.task.createdAt != null) {
          emit(
            EditorState.saveOld(task: newTask),
          );
        } else {
          emit(
            EditorState.saveNew(task: newTask),
          );
        }
        NavigationInherited.of(event.context).routerDelegate.popRoute(); //pop
      }
    }
  }

  Future<void> _editorRemover(
      EditorRemover event, Emitter<EditorState> emit) async {
    if (state is EditorStateLoaded) {
      emit(
        EditorState.delete(task: state.task),
      );
      NavigationInherited.of(event.context).routerDelegate.popRoute(); //pop
    }
  }
}
