part of 'tasks_bloc.dart';

//freezed then
@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial({
    required Repository rep,
  }) = TasksStateInitial;

  const factory TasksState.loaded(
      {required List<Task> myTasks,
      required Repository rep,
      required bool hideDone, //UI
      required bool loaded}) = TasksStateLoaded;

  //const factory TasksState.update() = _TasksStateUpdate;
}
