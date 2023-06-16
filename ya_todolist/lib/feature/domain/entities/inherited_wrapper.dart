import 'package:flutter/material.dart';

import 'task_entitiy.dart';

class InheritedWrapper extends StatefulWidget {
  final Widget child;
  InheritedWrapper({Key? key, required this.child}) : super(key: key);

  @override
  List<Task> myTasks = [];
  @override
  bool viewDone = true;

  static InheritedWrapperState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>())!
        .data;
  }

  @override
  InheritedWrapperState createState() => InheritedWrapperState();
}

class InheritedWrapperState extends State<InheritedWrapper> {
  //List<Task> myTasks = [];
  bool viewDone = true;

  void callBack() {
    setState(() {
      //todo
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
        child: this.widget.child, data: this, viewDone: viewDone);
  }
}

class MyInheritedWidget extends InheritedWidget {
  //List<Task> myTasks = [ Task(id: 0)];
  bool viewDone = true;

  MyInheritedWidget(
      {Key? key,
      required this.child,
      required this.data,
      required this.viewDone})
      : super(key: key, child: child);

  final Widget child;

  final InheritedWrapperState data;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return viewDone != oldWidget.viewDone;
  }
}
