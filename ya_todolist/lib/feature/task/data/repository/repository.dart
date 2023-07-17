import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

import '../domain/data_interface.dart';
import '../local/local_storage.dart';
import '../network/network_storage.dart';

class Repository extends DataInterface {
  Repository({
    required this.networkStorage,
    required this.localStorage,
  });

  final LocalStorage localStorage;
  final NetworkStorage networkStorage;

  @override
  Future<void> init() async {
    Logs.logImpl.logg('Repository: initialization start...');
    await localStorage.init();
    await networkStorage.init();
    Logs.logImpl.fine('Repository: initialized!');
  }

  /* Логика синхронизации 
  - грузим данные из облака и локалки
  - далее только, если ревизии разные
  - создаем мапу по локальному хранилищу
  - добавляем таски, которых нет в мапе
  - обновляем таски, которые есть, если они обновлены позднее
  - удаляем таски из локалки, если их нет в беки или они удалены позднее последнего обновления бека  
  */
  Future<bool> checkChanges(
      List<Task> networkTasks, List<Task> localTasks) async {
    return (!localTasks.every(networkTasks.contains) ||
        !localTasks.every(networkTasks.contains));
  }

  Future<void> syncStoragesV2() async {
    Logs.logImpl.logg(
        'Repository: Storage synchronization v2 [ Loc_rev - ${localStorage.revision}, Net_rev - ${networkStorage.revision} ]...');
    final localTasks = await localStorage.getTasks();
    late List<Task>? networkTasks;
    if (networkStorage.revision != null) {
      networkTasks = await networkStorage.getTasks();
    } else {
      networkTasks = null;
    }

    if (networkTasks != null) {
      if (networkStorage.revision != localStorage.revision! ||
          await checkChanges(networkTasks, localTasks)) {
        if (networkTasks.isNotEmpty) {
          final localTasksMap = <String, Task>{
            for (var task in localTasks) task.id: task
          };
          for (final netTask in networkTasks) {
            if (!localTasksMap.containsKey(netTask.id)) {
              await localStorage.addTask(netTask);
            } else {
              final locTask = localTasksMap[netTask.id]!;
              if (locTask.changedAt!.isBefore(netTask.changedAt!)) {
                await localStorage.updateTask(netTask);
              } else if (locTask.deleted) {
                await localStorage.deleteTask(locTask.id);
                localTasks.removeWhere((element) => element.id == locTask.id);
              }
            }
          }
          for (final delTask in localTasks.where((e) => e.deleted).toList()) {
            await localStorage.deleteTask(delTask.id);
          }
          //localStorage.updateTasks(localTasks);
          Logs.logImpl.logg('Repository: Successful merging!');
        } else {
          Logs.logImpl.logg(
              'Repository: Synchronization from localStorage. ERROR IN NET LIST!');
        }
        if (await networkStorage.updateTasks(await localStorage.getTasks())) {
          localStorage.revision = networkStorage.revision!;
          localStorage.writeRev(networkStorage.revision!);
        }
      } else {
        Logs.logImpl.logg('Repository: No need to sync');
      }
    }
    
    Logs.logImpl.fine('Repository: synchronization completed!');
  }

  @override
  Future<List<Task>?> getTasks() async {
    return localStorage.getTasks();
  }

  @override
  Future<Task?> getTask(String id) async {
    return localStorage.getTask(id);
  }

  @override
  Future<bool> addTask(Task task) async {
    await localStorage.addTask(task);
    await networkStorage.addTask(task);
    return true;
  }

  @override
  Future<bool> updateTask(Task task) async {
    await localStorage.updateTask(task);
    await networkStorage.updateTask(task);
    return true;
  }

  @override
  Future<bool> deleteTask(String id) async {
    bool deletedNet = await networkStorage.deleteTask(id);
    if (deletedNet) {
      await localStorage.deleteTask(id);
    }
    return deletedNet;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    localStorage.updateTasks(tasks);
    networkStorage.updateTasks(tasks);
    return true;
  }
}
