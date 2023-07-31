import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

class EditorState extends Equatable {
  const EditorState(
      {required this.editMode,
      required this.textController,
      required this.task});
  final Task task;
  final bool editMode;
  final TextEditingController textController;
  @override
  List<Object> get props => [task, editMode, textController];
}
