import 'package:flutter_test/flutter_test.dart';

import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

void main() {
  group('Task', () {
    test('Task toJson / fromJson', () {
      Task checkTask = Task(
          text: 'Test text',
          changedAt: DateTime.now(),
          createdAt: DateTime.now());
      final json = checkTask.toJson();
      expect(checkTask, Task.fromJson(json));
    });
  });
}
