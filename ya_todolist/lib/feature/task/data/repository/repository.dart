import 'package:ya_todolist/common/logger.dart';
import 'package:ya_todolist/feature/task/domain/task_model.dart';

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

  /*Future<bool> checkChanges() async {
    final networkStorageTasks = (await networkStorage.getTasks()).data ?? [];
    final localTasks = await localStorage.getTasks();
    return !networkStorageTasks.every(localTasks.contains) ||
        !localTasks.every(networkStorageTasks.contains);
  }

  Future<void> syncStorages() async {
    final network = await networkStorage.getTasks();
    if (await _persistenceUtil.getTasksRevision() != network.revision ||
        await checkChanges()) {
      await _persistenceUtil.saveTasksRevision(revision: network.revision ?? 0);
      final localTasks = await getLocalTasks();

      if (network.data != null) {
        final localTasksMap = <String, Task>{
          for (var task in localTasks) task.id: task
        };
        for (final task in network.data!) {
          if (!localTasksMap.containsKey(task.id)) {
            await localStorage.addTask(task);
          } else {
            final tempTask = localTasksMap[task.id];
            if (tempTask!.changedAt.isBefore(task.changedAt)) {
              await localStorage.updateTask(task);
            } else if (tempTask.deleted != null && tempTask.deleted!) {
              await localStorage.deleteTask(tempTask.id);
            }
          }
        }
      }
      await networkStorage.syncTasks(await localStorage.getTasks());
    }
  }*/

  @override
  Future<void> init() async {
    Logs.logImpl.writeLog('start initializing');
    await localStorage.init();
    await networkStorage.init();
  }

  Future<void> syncStorages() async {
    Logs.logImpl.writeLog('Storage synchronization...');
    final net = await networkStorage.getTasks();
    final locRev = await localStorage.readRev();
    if (net != null) {
      Logs.logImpl
          .writeLog('Loc_rev: $locRev, Net_rev: ${networkStorage.revision}');
      if (networkStorage.revision! < locRev!) {
        Logs.logImpl.writeLog('Synchronization from localStorage...');
        if (networkStorage.revision != 0) {
          localStorage.revision = networkStorage.revision;
          localStorage.writeRev(networkStorage.revision!);
        }
      } else {
        Logs.logImpl.writeLog('Synchronization from networkStorage...');
        localStorage.writeInfo(net, networkStorage.revision!);
      }
    } else {
      Logs.logImpl
          .writeLog('Synchronization from localStorage. ERROR IN NET...');
    }
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
    localStorage.addTask(task);
    networkStorage.addTask(task);
    return true;
  }

  @override
  Future<bool> updateTask(Task task) async {
    localStorage.updateTask(task);
    networkStorage.updateTask(task);
    return true;
  }

  @override
  Future<bool> deleteTask(String id) async {
    localStorage.deleteTask(id);
    networkStorage.deleteTask(id);
    return true;
  }

  @override
  Future<bool> updateTasks(List<Task> tasks) async {
    localStorage.updateTasks(tasks);
    networkStorage.updateTasks(tasks);
    return true;
  }
}
