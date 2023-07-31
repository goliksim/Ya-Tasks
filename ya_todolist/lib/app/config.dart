import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:ya_todolist/common/logger.dart';

class FirebaseConfig {
  final remoteConfig = FirebaseRemoteConfig.instance;
  static const String priorityColorDefault = 'FFFF3B30';
  StreamSubscription? subscription;

  Future<void> remoteConfigUpdate(callback) async {
    //settings
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig
        .setDefaults({_ConfigFields.priorityColor: priorityColorDefault});
    //first get
    await getColor().then((val) {
      callback(val);
    });
    //listen for update
    if (subscription != null) {
      await subscription!.cancel();
      subscription = null;
    }
    subscription = remoteConfig.onConfigUpdated.listen((event) async {
      await getColor().then((val) {
        callback(val);
      });
    });
  }

  Future<String> getColor() async {
    try {
      await remoteConfig.fetchAndActivate();
      final tmp = remoteConfig.getString(_ConfigFields.priorityColor);
      Logs.fine('RemoteConfig: loaded with priorityColor - $tmp');
      return tmp;
    } catch (e) {
      Logs.warning('RemoteConfig: fetchAndActivate problems!');
      return priorityColorDefault;
    }
  }
}

abstract class _ConfigFields {
  static const priorityColor = 'priorityColor';
}
