import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/feature/task/domain/task_model.dart';
import 'package:ya_todolist/common/logger.dart';
import 'editor_events.dart';
import 'editor_state.dart';

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
    Logs.logImpl.writeLog('Update text: ${event.text}');
  }*/

  Future<void> _editorUpdatePriority(
      EditorUpdatePriority event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(priority: event.priority),
      ),
    );
    Logs.logImpl.writeLog('Update priority: ${event.priority}');
  }

  Future<void> _editorUpdateDeadline(
      EditorUpdateDeadline event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(deadline: event.deadline),
      ),
    );
    Logs.logImpl.writeLog('Update deadlineDate: ${event.deadline}');
  }

  Future<void> _editorDeleteDeadline(
      EditorDeleteDeadline event, Emitter<EditorState> emit) async {
    emit(
      EditorState(
        task: state.task.copyWith(deleteDeadline: true),
      ),
    );
    Logs.logImpl.writeLog('Delete deadlineDate');
  }
}
