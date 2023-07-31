import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../task/data/domain/task_model.dart';

abstract class EditorEvent extends Equatable {
  const EditorEvent();

  @override
  List<Object> get props => [];
}

class EditorLoad extends EditorEvent {
  final BuildContext context;
  final String? id;

  const EditorLoad({required this.id, required this.context});

  @override
  List<Object> get props => [context, id!];
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
