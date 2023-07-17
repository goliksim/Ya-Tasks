import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/domain/data_interface.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

import 'network_settings.dart';

class NetworkStorage extends DataInterface {
  final NetworkSettings networkSettings;
  int? revision;

  NetworkStorage({required this.networkSettings, this.revision});
  @override
  Future<void> init() async {
    await getTasks();
    Logs.logImpl.fine('NetworkStorage: inited.');
  }

  Future<int?> getRev() async {
    try {
      final response = await networkSettings.get('/list');
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];

        //Logs.logImpl.logImpl.writeLog('Sucessful get tasksList from network');
        return revision!;
      }
      Logs.logImpl.warning('NetworkStorage: getTasks - STATUSCODE != 200');

      return null;
    } catch (e) {
      Logs.logImpl.warning('NetworkStorage: NETWORK ERROR - $e');
    }
    return null;
  }

  @override
  Future<bool> addTask(Task task) async {
    final apiTask = <String, dynamic>{'element': task.toJson()};
    try {
      final rev = await getRev();
      final response = await networkSettings.post('/list', apiTask, rev!);
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logImpl.logg('NetworkStorage: sucessful add task');
        return true;
      }
      Logs.logImpl.warning('NetworkStorage: addTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.warning('NetworkStorage: NETWORK ERROR - $e');
    }
    return false;
  }

  @override
  Future<bool> deleteTask(String id) async {
    try {
      final rev = await getRev();
      final response = await networkSettings.delete('/list/$id', rev!);

      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logImpl.logg('NetworkStorage: sucessful delete task');
        return true;
      }
      Logs.logImpl.warning('NetworkStorage: deleteTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.warning('NetworkStorage: NETWORK ERROR - $e');
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
        Logs.logImpl.logg('NetworkStorage: sucessful get task');
        return Task.fromJson(jsonResponce['element']);
      }
      Logs.logImpl.warning('NetworkStorage: getTask - STATUSCODE != 200');
      return null;
    } catch (e) {
      Logs.logImpl.warning('NetworkStorage: NETWORK ERROR - $e');
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

        //Logs.logImpl.logImpl.writeLog('Sucessful get tasksList from network');
        return [
          for (Map<String, dynamic> item in jsonResponce['list'])
            Task.fromJson(item)
        ];
      }
      Logs.logImpl.warning('NetworkStorage: getTasks - STATUSCODE != 200');
      return null;
    } catch (e) {
      Logs.logImpl.warning('NetworkStorage: NETWORK ERROR - $e');
    }
    return null;
  }

  @override
  Future<bool> updateTask(Task task) async {
    final apiTask = {'element': task.toJson()};
    try {
      final rev = await getRev();
      final response =
          await networkSettings.put('/list/${task.id}', apiTask, rev!);

      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logImpl.logg('NetworkStorage: sucessful update task');
        return true;
      }
      Logs.logImpl.warning('NetworkStorage: updateTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.logg('NetworkStorage: NETWORK ERROR - $e');
    }
    return false;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    final requestData = <String, dynamic>{
      'list': tasks.map((task) => task.toJson()).toList(),
    };
    try {
      final rev = await getRev();
      final response = await networkSettings.patch('/list', requestData, rev!);
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];

        Logs.logImpl.logg('NetworkStorage: sucessful update tasksList');
        return true;
      }
      Logs.logImpl.logg('NetworkStorage: updateTasks - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logImpl.logg('NetworkStorage: NETWORK ERROR - $e');
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
