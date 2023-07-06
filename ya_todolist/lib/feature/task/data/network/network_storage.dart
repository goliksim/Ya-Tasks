import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/domain/data_interface.dart';
import 'package:ya_todolist/feature/task/domain/task_model.dart';

import 'network_settings.dart';

class NetworkStorage extends DataInterface {
  final NetworkSettings networkSettings;
  late int? revision;

  NetworkStorage({
    required this.networkSettings,
  });
  @override
  Future<void> init() async {
    Logs.logImpl.writeLog('newtworkStorage initialization...');
    await getTasks();
  }

  @override
  Future<bool> addTask(Task task) async {
    final apiTask = <String, dynamic>{'element': task.toJson()};
    try {
      final response = await networkSettings.post('/list', apiTask, revision!);
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logImpl.writeLog('Sucessful add task to network');
        return true;
      }
      Logs.logImpl.writeLog('addTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.writeLog('NETWORK ERROR: $e');
    }
    return false;
  }

  @override
  Future<bool> deleteTask(String id) async {
    try {
      final response = await networkSettings.delete('/list/$id', revision!);
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logImpl.writeLog('Sucessful delete task on network');
        return true;
      }
      Logs.logImpl.writeLog('deleteTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.writeLog('NETWORK ERROR: $e');
    }
    return false;
  }

  @override
  Future<Task?> getTask(String id) async {
    try {
      final response = await networkSettings.get('/list/$id');
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];
        Logs.logImpl.writeLog('Sucessful get task from network');
        return Task.fromJson(jsonResponce['element']);
      }
      Logs.logImpl.writeLog('getTask - STATUSCODE != 200');
      return null;
    } catch (e) {
      Logs.logImpl.writeLog('NETWORK ERROR: $e');
    }
    return null;
  }

  @override
  Future<List<Task>?> getTasks() async {
    try {
      final response = await networkSettings.get('/list');
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];

        //Logs.logImpl.writeLog('Sucessful get tasksList from network');
        return [
          for (Map<String, dynamic> item in jsonResponce['list'])
            Task.fromJson(item)
        ];
      }
      Logs.logImpl.writeLog('getTasks - STATUSCODE != 200');
      return null;
    } catch (e) {
      Logs.logImpl.writeLog('NETWORK ERROR: $e');
    }
    return null;
  }

  @override
  Future<bool> updateTask(Task task) async {
    final apiTask = {'element': task.toJson()};
    try {
      final response =
          await networkSettings.put('/list/${task.id}', apiTask, revision!);

      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logImpl.writeLog('Sucessful update task on network');
        return true;
      }
      Logs.logImpl.writeLog('updateTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.writeLog('NETWORK ERROR: $e');
    }
    return false;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    final requestData = <String, dynamic>{
      'list': tasks.map((task) => task.toJson()).toList(),
    };
    try {
      final response =
          await networkSettings.patch('/list', requestData, revision!);

      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];

        Logs.logImpl.writeLog('Sucessful update tasksList on network');
        return true;
      }
      Logs.logImpl.writeLog('updateTasks - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.writeLog('NETWORK ERROR: $e');
    }
    return false;
  }

  /*Future<ResponseData<List<Task>>> syncTasks(List<Task> tasks) async {
    final requestData = <String, dynamic>{
      'list': tasks.map((task) => task.toJson()).toList(),
    };
    try {
      final response = await _networkSettings.patch('/list', requestData);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;
        logger.info(
            'Sync tasks from network storage and local storage: ${response.statusMessage}');
        final listJson = json['list'] as List<dynamic>;
        final data = listJson
            .map((e) => Task.fromJson(e as Map<String, dynamic>))
            .toList();

        final revision = json['revision'] as int;
        await _persistenceUtil.saveTasksRevision(revision: revision);

        return ResponseData(response.statusCode!, data, revision);
      }
      return ResponseData.error(response.statusCode!);
    } on NoInternetCustomException catch (e) {
      logger.info('Sync tasks from network storage error: $e');
      return ResponseData.error(503);
    } on ResponseCustomException catch (e) {
      logger.info('Sync tasks from network storage error: $e');
      return ResponseData.error(400);
    } on UnknownNetworkCustomException catch (e) {
      logger.info('Sync tasks from network storage error: $e');
      return ResponseData.error(500);
    } on Exception catch (e) {
      logger.info('Sync tasks from network storage error: $e');
      return ResponseData.error(500);
    }
  }*/
}
