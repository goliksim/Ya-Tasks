import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/storage.dart';
import '../../domain/entities/task_entitiy.dart';
import '../widgets/simple_animation.dart';
import 'task_list_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  bool loadingBool = false;

  Future loading(context) async {
    await tasksStorage.readTasks().then((value) {
      myTasks = value;
    });
    loadingBool = true;
    Navigator.of(context)
        .pushReplacement(simpleFadePageRoute(const MyHomePage()));
  }

  @override
  void initState() {
    super.initState();
    //startTimer();
    loading(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
