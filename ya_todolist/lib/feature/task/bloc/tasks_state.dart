part of 'tasks_bloc.dart';

//freezed then
class TasksState extends Equatable {
  const TasksState(
      {required this.routerDelegate,
      required this.myTasks,
      required this.rep,
      required this.hideDone, //UI
      required this.loaded});

  final List<Task> myTasks;
  final Repository rep;
  //final ApiUtil apiUtil;
  final bool hideDone;
  final bool loaded;
  final MyRouterDelegate routerDelegate;

  @override
  List<Object> get props => [myTasks, hideDone, loaded, routerDelegate];
}

class TasksStateLoading extends TasksState {
  const TasksStateLoading(
      {required super.myTasks,
      required super.routerDelegate,
      required super.rep,
      required super.hideDone,
      super.loaded = true});
}

class TasksStateUpdate extends TasksState {
  TasksStateUpdate(
      {required super.myTasks,
      required super.routerDelegate,
      required super.rep,
      required super.hideDone,
      super.loaded = true}) {
    rep.updateTasks(myTasks);
    //apiUtil.patchData(myTasks);
    //tasksStorage.writeTasks(myTasks, apiUtil.revVersion + 1);
  }
}
