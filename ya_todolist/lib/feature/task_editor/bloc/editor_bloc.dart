import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        task: Task(createdAt: DateTime.now(), changedAt: DateTime.now()),
            editMode: editMode,
            )) {
    //on<EditorUpdateText>(_editorUpdateText);
    on<EditorLoad>(_loadTask);
    on<EditorUpdatePriority>(_editorUpdatePriority);
    on<EditorUpdateDeadline>(_editorUpdateDeadline);
    on<EditorDeleteDeadline>(_editorDeleteDeadline);
  }

  Future<void> _loadTask(EditorLoad event, Emitter<EditorState> emit) async {
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
            task: task,
            editMode: true,
          ),
        );
        Logs.logg('EditorBloc: load task from storage: $task');
        return;
      }
    }
    Logs.logg('EditorBloc: failed to load task from storage');
    emit(
      EditorState.loaded(
        task: state.task,
        editMode: false,
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
}
