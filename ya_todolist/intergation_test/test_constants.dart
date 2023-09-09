import 'package:mocktail/mocktail.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/data/local/local_db.dart';
import 'package:ya_todolist/feature/task/data/local/local_storage.dart';
import 'package:ya_todolist/feature/task/data/network/network_storage.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';

class RepositoryMock extends Mock implements Repository {}

class LocalMock extends Mock implements LocalStorage {
  @override
  int? revision = 1;

  final List<Task> _list = [
    Task(
      id: '1',
      text: 'First task',
      createdAt: DateTime.utc(0),
      changedAt: DateTime.utc(0),
    ),
    Task(
      id: '2',
      text: 'Second task',
      createdAt: DateTime.utc(0),
      changedAt: DateTime.utc(0),
    ),
    Task(
      id: '3',
      text: 'Third task',
      createdAt: DateTime.utc(1),
      changedAt: DateTime.utc(1),
      deleted: true,
    ),
    Task(
      id: '4',
      text: 'Fourth task',
      createdAt: DateTime.utc(1),
      changedAt: DateTime.utc(1),
      deleted: true,
    ),
  ];

  late List<Task> list;

  @override
  Future<void> init() async {
    list = _list;
  }

  @override
  Future<List<Task>> getTasks() async {
    return list;
  }

  @override
  Future<bool> addTask(Task task) async {
    list.add(task);
    return true;
  }

  @override
  Future<bool> updateTask(Task newTask) async {
    list = List<Task>.from(list).map((task) {
      return task.id == newTask.id ? newTask : task;
    }).toList();
    return true;
  }

  @override
  Future<bool> deleteTask(String id) async {
    list = list.where((task) => task.id != id).toList();
    return true;
  }

  @override
  Future<void> writeRev(int rev) async {
    revision = rev;
  }
}

class NetworkMock extends Mock implements NetworkStorage {
  @override
  int? revision;

  @override
  Future<List<Task>?> getTasks() async {
    if (revision == null) {
      return null;
    }
    final result = [
      Task(
        id: '1',
        text: 'First task',
        createdAt: DateTime.utc(0),
        changedAt: DateTime.utc(0),
      ),
      Task(
        id: '2',
        text: 'Updated task',
        createdAt: DateTime.utc(0),
        changedAt: DateTime.utc(1),
      ),
      Task(
        id: '3',
        text: 'Third task',
        createdAt: DateTime.utc(0),
        changedAt: DateTime.utc(0),
      ),
      Task(
        id: '4',
        text: 'Recovery task',
        createdAt: DateTime.utc(2),
        changedAt: DateTime.utc(2),
      ),
      Task(
        id: '5',
        text: 'New task',
        createdAt: DateTime.utc(0),
        changedAt: DateTime.utc(0),
      ),
    ];
    return result;
  }

  @override
  Future<bool> updateTasks(List<Task> newTask) async {
    return true;
  }
}

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
        db: LocalDB(),
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
    when(() => mock.syncStorages()).thenAnswer(
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
