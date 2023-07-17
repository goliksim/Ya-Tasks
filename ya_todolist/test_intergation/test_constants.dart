import 'package:mocktail/mocktail.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/data/local/local_settings.dart';
import 'package:ya_todolist/feature/task/data/local/local_storage.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';

class RepositoryMock extends Mock implements Repository {}

class TaskListTestConstants {
  static final List<Task> taskList = [
    Task(
      id: '0',
      text: 'Some text of Task0',
      done: false,
      createdAt: DateTime.parse('2023-07-01'),
      changedAt: DateTime.parse('2023-07-01'),
    ),
    Task(
      id: '1',
      text: 'Some text of Task1',
      done: false,
      importance: Importance.important,
      createdAt: DateTime.parse('2023-07-01'),
      changedAt: DateTime.parse('2023-07-01'),
    ),
  ];

  static void arrangeRepositoryMock(
    RepositoryMock mock, {
    Duration? delay,
    List<Task>? taskList,
  }) {
    when(() => mock.localStorage).thenReturn(
      LocalStorage(
        userId: 'test_id',
        localSettings: LocalSettings(),
      ),
    );

    when(() => mock.init()).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return;
      },
    );
    when(() => mock.syncStoragesV2()).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return;
      },
    );
    when(() => mock.getTasks()).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return taskList ?? [];
      },
    );
    when(() => mock.getTask(any())).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return;
      },
    );
    when(() => mock.deleteTask(any())).thenAnswer((_) async {
      if (delay != null) {
        await Future.delayed(delay);
      }
      return true;
    });
    when(() => mock.updateTask(any())).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return true;
      },
    );
    when(() => mock.addTask(any())).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return true;
      },
    );
    when(() => mock.updateTasks(any())).thenAnswer(
      (_) async {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return true;
      },
    );
  }
}
