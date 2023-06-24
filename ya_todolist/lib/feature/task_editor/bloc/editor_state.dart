import 'package:equatable/equatable.dart';
import 'package:ya_todolist/feature/task/domain/task_entitiy.dart';

class EditorState extends Equatable {
  const EditorState({required this.task});
  final Task task;

  @override
  List<Object> get props => [task];
}
