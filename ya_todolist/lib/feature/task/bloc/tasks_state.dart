part of 'tasks_bloc.dart';

//freezed then
@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial({
    required Repository rep,
  }) = TasksStateInitial;

  const factory TasksState.loaded(
      {required List<Task> myTasks,
      required Repository rep, //TODO MOVE REPOSITORY TO DI
      required SortingType sortingType,
      required bool loaded}) = TasksStateLoaded;

  //const factory TasksState.update() = _TasksStateUpdate;
}
