part of 'tasks_bloc.dart';

//freezed then
class TasksState extends Equatable {
  const TasksState(
      {required this.myTasks,
      required this.apiUtil,
      required this.hideDone, //UI
      this.loaded = true});

  final List<Task> myTasks;
  final ApiUtil apiUtil;
  final bool hideDone;
  final bool loaded;

  @override
  List<Object> get props => [myTasks, hideDone, loaded];
}
