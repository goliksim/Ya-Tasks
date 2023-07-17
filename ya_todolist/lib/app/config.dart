import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:ya_todolist/common/logger.dart';

class FirebaseConfig {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future initializeConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    await remoteConfig.setDefaults({_ConfigFields.priorityColor: '0xFFFF3B30'});
    await remoteConfig.fetchAndActivate();
    var tmp = remoteConfig.getString(_ConfigFields.priorityColor);
    Logs.logIns.writeLog('RemoteConfig loaded with $tmp');
    return tmp;
  }
}

abstract class _ConfigFields {
  static const priorityColor = 'priorityColor';
}
