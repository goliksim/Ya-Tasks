import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:ya_todolist/firebase_options.dart';

import '../common/logger.dart';

abstract class Locator {
  static Future<void> init(String? flavorName) async {
    WidgetsFlutterBinding.ensureInitialized();
    _initFlavor(flavorName);

    await _initFirebase();
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Logs.logImpl.fine('Locator: Firebase initialized!');
    _initCrashlytics();
  }

  static void _initCrashlytics() {
    FlutterError.onError = (errorDetail) {
      Logs.logImpl.warning(
          'Crashlytics: Caught error in FlutterError.onError\n$errorDetail');
      FirebaseCrashlytics.instance.recordFlutterError(errorDetail);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      Logs.logImpl.warning(
          'Crashlytics: Catch error in PlatformDispatcher.onError\n$error');
      FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        fatal: true,
      );
      return true;
    };
  }

  static void _initFlavor(String? flavorName) {
    FlavorConfig(
      name: flavorName,
      color: Colors.red,
      location: BannerLocation.topEnd,
    );
  }

  Future<void> dispose() async {}

  static FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
}
