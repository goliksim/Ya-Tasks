import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const String hiveDir = './test/utils/cache';

typedef TDBMB = TestDefaultBinaryMessengerBinding;

void mockMethodChannel() {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');
  final binMess = TDBMB.instance.defaultBinaryMessenger;
  binMess.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
    return hiveDir;
  });
}

Future<void> deleteMockCache() async {
  await Future.delayed(const Duration(seconds: 1));
  Directory directory = Directory(hiveDir);

  directory.listSync().forEach((e) => e.deleteSync(recursive: true));
}
