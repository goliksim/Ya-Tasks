part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {
  final List<Task> tasks;
  final ApiUtil apiUtil;
  const LoadTasks({required this.tasks, required this.apiUtil});
}

class InsertTask extends TasksEvent {
  final Task task;
  final int index;

  const InsertTask({required this.task, required this.index});
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DoneFilter extends TasksEvent {
  const DoneFilter();
}
