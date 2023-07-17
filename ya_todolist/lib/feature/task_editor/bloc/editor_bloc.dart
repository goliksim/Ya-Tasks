import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/common/logger.dart';
import 'editor_events.dart';
import 'editor_state.dart';

extension TaskBuilder on BuildContext {
  EditorState? get editState => BlocProvider.of<EditorBloc>(this).state;
  EditorBloc? get editBloc => BlocProvider.of<EditorBloc>(this);
}

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc({required Task currentTask})
      : super(EditorState(task: currentTask)) {
    //on<EditorUpdateText>(_editorUpdateText);
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
    Logs.logImpl.logImpl.writeLog('Update text: ${event.text}');
  }*/

  Future<void> _editorUpdatePriority(
      EditorUpdatePriority event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(importance: event.priority),
      ),
    );
    Logs.logImpl.logg('EditorBloc: update priority: ${event.priority}');
  }

  Future<void> _editorUpdateDeadline(
      EditorUpdateDeadline event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(deadline: event.deadline),
      ),
    );
    Logs.logImpl.logg('EditorBloc: update deadlineDate: ${event.deadline}');
  }

  Future<void> _editorDeleteDeadline(
      EditorDeleteDeadline event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(deadline: null),
      ),
    );
    Logs.logImpl.logg('EditorBloc: delete deadlineDate');
  }
}
