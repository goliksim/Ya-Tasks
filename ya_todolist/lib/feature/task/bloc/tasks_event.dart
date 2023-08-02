part of 'tasks_bloc.dart';

@freezed
abstract class TasksEvent with _$TasksEvent {
  const factory TasksEvent.load() = LoadTasks;
  const factory TasksEvent.filter() = DoneFilter;
  const factory TasksEvent.add({required Task task}) = AddTask;
  const factory TasksEvent.update({required Task task}) = UpdateTask;
  const factory TasksEvent.delete({required Task task}) = DeleteTask;
  //const factory TasksEvent.insert({required this.task, required this.index}) = InsertTask;
}
