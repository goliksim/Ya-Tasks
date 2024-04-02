import 'package:flutter_test/flutter_test.dart';
import 'package:ya_todolist/feature/task/data/mappers/task_entity_to_api_model_mapper.dart';
import 'package:ya_todolist/feature/task/data/models/remote/task_model_api.dart';

import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

void main() {
  group('Task', () {
    test('Task toJson / fromJson', () {
      Task checkTask = Task(
          text: 'Test text',
          changedAt: DateTime.now(),
          createdAt: DateTime.now());

      final apiTask = TaskEntityToApiModelMapper.map(checkTask);
      final json = apiTask.toJson();
      expect(checkTask, TaskApiModel.fromJson(json));
    });
  });
}
