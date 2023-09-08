import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:ya_todolist/feature/task/data/local/local_db.dart';
import 'package:ya_todolist/feature/task/data/local/local_storage.dart';

import '../utils/mock_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  mockMethodChannel();
  group('DB tests', () {
    final db = LocalDB();

    // new task for testing
    final newTask = Task(
      id: const Uuid().v4(),
      text: 'New Task',
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
    );
    final newTaskId = newTask.id;

    test('Get empty task list', () async {
      await db.init();
      final tasks = db.getTasks();

      expect(tasks!.length, 0);
    });

    test('Get a non-existent task', () async {
      final task = db.getTask(newTaskId);

      expect(task, isNull);
    });

    test('Put new Task', () async {
      db.put(newTask);

      final task = db.getTask(newTaskId);
      expect(task!.id, isNotEmpty);
    });

    test('Get task list', () async {
      final tasks = db.getTasks();

      expect(tasks!.isNotEmpty, isTrue);
    });

    test('Delete task', () async {
      db.delete(newTaskId);

      final task = db.getTask(newTaskId);
      expect(task, isNull);
    });
  });
  group('Storage tests', () {
    final db = LocalDB();
    final loc = LocalStorage(db: db);

    test('getId - returns null if not set', () async {
      final id = db.getId;
      expect(id, isNull);
    });

    test('readId - returns not null device_id', () async {
      final id = await loc.readId();
      expect(id, isNotNull);
    });

    test('readRev - returns -1 if wasnt loaded', () async {
      final revision = await loc.readRev();
      expect(revision == -1, isTrue);
    });

    test('writeRev - saves and retrieves revision correctly', () async {
      const expectedRevision = 42;
      await loc.writeRev(expectedRevision);
      final retrievedRevision = await loc.readRev();
      expect(retrievedRevision, equals(expectedRevision));
    });

    tearDownAll(() async {
      await db.clearDB();
      await deleteMockCache();
    });
  });
}
