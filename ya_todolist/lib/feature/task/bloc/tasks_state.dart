part of 'tasks_bloc.dart';

//freezed then
class TasksState extends Equatable {
  const TasksState(
      {required this.myTasks,
      required this.rep,
      required this.hideDone, //UI
      required this.loaded});

  final List<Task> myTasks;
  final Repository rep;
  final bool hideDone;
  final bool loaded;

  @override
  List<Object> get props => [myTasks, hideDone, loaded];
}

class TasksStateLoading extends TasksState {
  const TasksStateLoading(
      {required super.myTasks,
      required super.rep,
      required super.hideDone,
      super.loaded = true});
}

class TasksStateLoaded extends TasksState {
  const TasksStateLoaded(
      {required super.myTasks,
      required super.rep,
      required super.hideDone,
      super.loaded = true});
}

class TasksStateUpdate extends TasksState {
  TasksStateUpdate(
      {required super.myTasks,
      required super.rep,
      required super.hideDone,
      super.loaded = true}) {
    rep.updateTasks(myTasks);
  }
}
