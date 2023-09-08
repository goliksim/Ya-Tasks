import 'package:flutter_test/flutter_test.dart';
import 'package:ya_todolist/feature/task/data/repository/repository.dart';

import '../../intergation_test/test_constants.dart';
import '../utils/mock_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  mockMethodChannel();
  group('Repository tests', () {
    final rep =
        Repository(localStorage: LocalMock(), networkStorage: NetworkMock());

    void checkSync(tasks, newTasks) {
      expect(tasks.length == 4, isTrue);
      expect(newTasks.length == 4, isTrue);
      expect(newTasks.where((e) => e.id == '2').first.text == 'Updated task',
          isTrue);
      expect(newTasks.where((e) => e.id == '4').first.text == 'Recovery task',
          isTrue);
      expect(newTasks.where((e) => e.id == '5').isNotEmpty, isTrue);
    }

    setUp(
      () => rep.localStorage.init(),
    );

    test('Sync test 1 - not response', () async {
      final tasks = await rep.localStorage.getTasks();
      await rep.syncStorages();
      final newTasks = await rep.localStorage.getTasks();
      expect(tasks == newTasks, isTrue);
    });

    test('Sync test 2 - same revision', () async {
      rep.localStorage.revision = 1;
      rep.networkStorage.revision = 1;

      final tasks = await rep.localStorage.getTasks();
      await rep.syncStorages();

      final newTasks = await rep.localStorage.getTasks();

      checkSync(tasks, newTasks);
    });

    test('Sync test 3 - different revisions', () async {
      rep.localStorage.init(); //reset list

      rep.localStorage.revision = 3;
      rep.networkStorage.revision = 1;

      final tasks = await rep.localStorage.getTasks();
      await rep.syncStorages();

      final newTasks = await rep.localStorage.getTasks();

      checkSync(tasks, newTasks);
    });

    test('Sync test 4 - different revisions', () async {
      rep.localStorage.init(); //reset list

      rep.localStorage.revision = 1;
      rep.networkStorage.revision = 3;

      final tasks = await rep.localStorage.getTasks();
      await rep.syncStorages();

      final newTasks = await rep.localStorage.getTasks();

      checkSync(tasks, newTasks);
    });
  });
}
