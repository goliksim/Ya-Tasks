import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/common/logger.dart';
import 'editor_events.dart';
import 'editor_state.dart';

extension TaskBuilder on BuildContext {
  EditorState? get editState => BlocProvider.of<EditorBloc>(this).state;
  EditorBloc? get editBloc => BlocProvider.of<EditorBloc>(this);
}

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc({required Task currentTask, bool editMode = false})
      : super(EditorState(
            task: currentTask,
            editMode: false,
            textController: TextEditingController(text: editMode ? ' ' : ''))) {
    //on<EditorUpdateText>(_editorUpdateText);
    on<EditorLoad>(_loadTask);
    on<EditorUpdatePriority>(_editorUpdatePriority);
    on<EditorUpdateDeadline>(_editorUpdateDeadline);
    on<EditorDeleteDeadline>(_editorDeleteDeadline);
  }

  /*Future<void> _editorUpdateText(
      EditorUpdateText event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(text: event.text),
      ),
      
    );
    Logs.logImpl.writeLog('Update text: ${event.text}');
  }*/

  Future<void> _loadTask(EditorLoad event, Emitter<EditorState> emit) async {
    final taskState = event.context.taskState!;
    if (!taskState.loaded) {
      await Future.doWhile(() async {
        bool loading = !taskState.loaded;
        await Future.delayed(const Duration(milliseconds: 500));
        return loading;
      });
    }

    if (event.id != null) {
      if (taskState.myTasks.any((e) => e.id == event.id && !e.deleted)) {
        final task = taskState.myTasks.where((e) => e.id == event.id).first;
        final textController = state.textController;
        textController.value = TextEditingValue(text: task.text);
        emit(
          EditorState(
            task: task,
            editMode: true,
            textController: textController,
          ),
        );
        Logs.logg('EditorBloc: load task from storage: $task');
        return;
      }
    }
    Logs.logg('EditorBloc: failed to load task from storage');
    emit(
      EditorState(
        task: state.task,
        editMode: false,
        textController: TextEditingController(),
      ),
    );
  }

  Future<void> _editorUpdatePriority(
      EditorUpdatePriority event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(importance: event.priority),
        editMode: state.editMode,
        textController: state.textController,
      ),
    );
    Logs.logg('EditorBloc: update priority: ${event.priority}');
  }

  Future<void> _editorUpdateDeadline(
      EditorUpdateDeadline event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(deadline: event.deadline),
        editMode: state.editMode,
        textController: state.textController,
      ),
    );
    Logs.logg('EditorBloc: update deadlineDate: ${event.deadline}');
  }

  Future<void> _editorDeleteDeadline(
      EditorDeleteDeadline event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(deadline: null),
        editMode: state.editMode,
        textController: state.textController,
      ),
    );
    Logs.logg('EditorBloc: delete deadlineDate');
  }
}
