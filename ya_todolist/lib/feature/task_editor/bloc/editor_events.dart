import 'package:equatable/equatable.dart';

import '../../task/domain/task_model.dart';

abstract class EditorEvent extends Equatable {
  const EditorEvent();

  @override
  List<Object> get props => [];
}

class EditorUpdateText extends EditorEvent {
  final String text;

  const EditorUpdateText({required this.text});

  @override
  List<Object> get props => [text];
}

class EditorUpdatePriority extends EditorEvent {
  final Importance priority;

  const EditorUpdatePriority({required this.priority});

  @override
  List<Object> get props => [priority];
}

class EditorUpdateDeadline extends EditorEvent {
  final DateTime deadline;

  const EditorUpdateDeadline({required this.deadline});

  @override
  List<Object> get props => [deadline];
}

class EditorDeleteDeadline extends EditorEvent {
  const EditorDeleteDeadline();
}
