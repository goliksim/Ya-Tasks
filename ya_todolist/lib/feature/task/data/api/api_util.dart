import 'package:ya_todolist/feature/task/data/api/model/task_api.dart';
import 'package:ya_todolist/feature/task/domain/task_entitiy.dart';

import 'service/network.dart';

class ApiUtil {
  final NetworkManager networkManager = NetworkManager();

  int revVersion;

  ApiUtil copyWith(int rev) {
    return ApiUtil(revVersion: rev);
  }

  ApiUtil({this.revVersion = 0});

  Future<List<Task>> getTaskList() async {
    final result = await networkManager.getData();
    return result!.map((apiTask) => TaskMapper.fromApi(apiTask)).toList();
  }

  Future<Task> getTask(String id) async {
    final result = await networkManager.getTask(id);
    return TaskMapper.fromApi(result!);
  }

  Future<bool> patchData(List<Task> tasks) async {
    List<Map<String, dynamic>> allTasksJson =
        tasks.map((e) => e.toJson()).toList();
    return await networkManager.patchData(allTasksJson);
  }

  Future<bool> postTask(Task task) async {
    return await networkManager.postTask(task.toJson());
  }
}
