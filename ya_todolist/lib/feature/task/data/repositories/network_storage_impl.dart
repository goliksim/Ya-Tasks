import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/mappers/task_api_model_to_entity_mapper.dart';
import 'package:ya_todolist/feature/task/data/mappers/task_entity_to_api_model_mapper.dart';
import 'package:ya_todolist/feature/task/data/models/remote/task_model_api.dart';
import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';
import 'package:ya_todolist/feature/task/domain/repositories/data_interface.dart';

import '../datasources/network_datasource_impl.dart';

class NetworkStorageImpl extends DataInterface {
  final NetworkSettings networkSettings;
  int? revision;

  NetworkStorageImpl({required this.networkSettings, this.revision});
  @override
  Future<void> init() async {
    await getTasks();
    Logs.fine('NetworkStorage: inited.');
  }

  Future<int?> getRev() async {
    try {
      final response = await networkSettings.get('/list');
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];

        //Logs.logImpl.writeLog('Sucessful get tasksList from network');
        return revision!;
      }
      Logs.warning('NetworkStorage: getTasks - STATUSCODE != 200');

      return null;
    } catch (e) {
      Logs.warning('NetworkStorage: NETWORK ERROR - $e');
    }
    return null;
  }

  @override
  Future<bool> addTask(Task task) async {
    final apiTask = <String, dynamic>{
      'element': TaskEntityToApiModelMapper.map(task).toJson()
    };
    try {
      final rev = await getRev();
      final response = await networkSettings.post('/list', apiTask, rev!);
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logg('NetworkStorage: sucessful add task');
        return true;
      }
      Logs.warning('NetworkStorage: addTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.warning('NetworkStorage: NETWORK ERROR - $e');
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
        Logs.logg('NetworkStorage: sucessful delete task');
        return true;
      }
      Logs.warning('NetworkStorage: deleteTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.warning('NetworkStorage: NETWORK ERROR - $e');
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
        Logs.logg('NetworkStorage: sucessful get task');
        return TaskApiModelToEntityMapper.map(
          TaskApiModel.fromJson(
            jsonResponce['element'],
          ),
        );
      }
      Logs.warning('NetworkStorage: getTask - STATUSCODE != 200');
      return null;
    } catch (e) {
      Logs.warning('NetworkStorage: NETWORK ERROR - $e');
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
            TaskApiModelToEntityMapper.map(TaskApiModel.fromJson(item))
        ];
      }
      Logs.warning('NetworkStorage: getTasks - STATUSCODE != 200');
      return null;
    } catch (e) {
      Logs.warning('NetworkStorage: NETWORK ERROR - $e');
    }
    return null;
  }

  @override
  Future<bool> updateTask(Task task) async {
    final apiTask = {'element': TaskEntityToApiModelMapper.map(task).toJson()};
    try {
      final rev = await getRev();
      final response =
          await networkSettings.put('/list/${task.id}', apiTask, rev!);

      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'] as int;
        Logs.logg('NetworkStorage: sucessful update task');
        return true;
      }
      Logs.warning('NetworkStorage: updateTask - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logg('NetworkStorage: NETWORK ERROR - $e');
    }
    return false;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    final requestData = <String, dynamic>{
      'list': tasks
          .map((task) => TaskEntityToApiModelMapper.map(task).toJson())
          .toList(),
    };
    try {
      final rev = await getRev();
      final response = await networkSettings.patch('/list', requestData, rev!);
      if (response.statusCode == 200) {
        var jsonResponce = response.data!;
        revision = jsonResponce['revision'];

        Logs.logg('NetworkStorage: sucessful update tasksList');
        return true;
      }
      Logs.logg('NetworkStorage: updateTasks - STATUSCODE != 200');
      return false;
    } catch (e) {
      Logs.logg('NetworkStorage: NETWORK ERROR - $e');
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
