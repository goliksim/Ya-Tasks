import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/feature/presentation/pages/task_editor_page.dart';
//import 'package:ya_todolist/feature/presentation/widgets/inherited_widget.dart';

import '../../../common/storage.dart';
import '../../domain/entities/task_entitiy.dart';

import '../../domain/entities/inherited_wrapper.dart';
import '../widgets/sliver_appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool viewDone = true;
  late int allDone;

  void callback() {
    setState(() {
      tasksStorage.writeTasks(myTasks);
      allDone = myTasks.where((element) => element.done).length;
    });
  }

  @override
  void initState() {
    super.initState();
    allDone = myTasks.where((element) => element.done).length;
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWrapper(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: CustomScrollView(
          slivers: <Widget>[
            //Text('${InheritedWrapper.of(context).viewDone}'),
            //Text('${myTasks}'),
            MySliverAppBar(allDone: allDone),
            _upSliverBorder(context), //no
            _mainSliverList(context, callback),
            _newSliverButton(context, callback),
            _downSliverBorder(context), //no
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            callNewPlayer(context, callback);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

bool a = true;

Widget _mainSliverList(BuildContext context, callback) => SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return (InheritedWrapper.of(context).viewDone &&
                    myTasks[index].done)
                ? const SizedBox()
                : Dismissible(
                    onDismissed: (direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        myTasks[index].done = !myTasks[index].done;
                        callback();
                        return false;
                      } else {
                        deletePlayerByIndex(context, index, callback);
                        //_quickDelete(index);

                      }
                      return null;
                    },
                    key: ValueKey(index),
                    background: Container(
                        color: Theme.of(context).colorScheme.onError,
                        padding: const EdgeInsets.only(left: 24),
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.check,
                                color:
                                    Theme.of(context).colorScheme.onPrimary))),
                    secondaryBackground: Container(
                        color: Theme.of(context).colorScheme.error,
                        padding: const EdgeInsets.only(right: 24),
                        alignment: Alignment.centerRight,
                        // ignore: sized_box_for_whitespace
                        child: Container(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.delete,
                                color:
                                    Theme.of(context).colorScheme.onPrimary))),
                    child: _taskWindow(context, callback, index),
                  );
          },
          childCount:
              myTasks.length, // InheritedWrapper.of(context).myTasks.length,
        ),
      ),
    );

Widget _taskWindow(BuildContext context, callback, int i) => GestureDetector(
      onTap: () {
        logs.writeLog('TO EDIT -> ${myTasks[i].show()}');
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => TaskEditorPage(
                      thisTask: myTasks[i],
                      editMode: true,
                    )))
            .then((value) {
          if (value != null) {
            if (value == 'delete') {
              logs.writeLog('DELETE -> ${myTasks[i].show()}');
              deletePlayerByIndex(context, i, callback);
            } else {
              logs.writeLog('FROM EDIT <- ${myTasks[i].show()}');
              myTasks[i] = value;
              callback();
            }
          }
        });
      },
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Row(
                //

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                          //checkColor: Colors.red,

                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.orange.withOpacity(.32);
                            }
                            return !myTasks[i].done
                                ? (myTasks[i].priority == 'Высокая'
                                    ? Theme.of(context).colorScheme.error
                                    : Theme.of(context).colorScheme.outline)
                                : Theme.of(context).colorScheme.onError;
                          }),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          value: myTasks[i].done,
                          onChanged: ((value) {
                            myTasks[i].done = value!;

                            callback();
                          }))),

                  const SizedBox(width: 12), // horizontal offset

                  _priorityWidget(context, myTasks[i].priority!),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(myTasks[i].text,
                            maxLines: 3,
                            softWrap: true,

                            //textAlign: TextAlign.start,

                            overflow: TextOverflow.ellipsis,
                            style: myTextTheme.subtitle1!.copyWith(
                                decoration: myTasks[i].done
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: !myTasks[i].done
                                    ? Theme.of(context).colorScheme.onBackground
                                    : Theme.of(context).colorScheme.tertiary)),
                        if (myTasks[i].deadline) const SizedBox(height: 4),
                        if (myTasks[i].deadline)
                          Text(printDate(myTasks[i].deadlineDate),
                              style: myTextTheme.headline3!.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary)),
                      ],
                    ),
                  ),
                ],
              )),

              const SizedBox(width: 14), // horizontal offset

              SizedBox(
                  height: 24,
                  width: 24,
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: Icon(Icons.info_outline,
                          color: Theme.of(context).colorScheme.tertiary)))
            ],
          ),
        ),
      ),
    );

Widget _priorityWidget(BuildContext context, String priority) =>
    priority != 'Нет'
        ? Container(
            width: 16,
            height: 20,
            alignment: Alignment.topCenter,
            child: FittedBox(
                child: priority == 'Высокая'
                    ? Text(
                        '!!',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      )
                    : const Text(
                        '⬇',
                        style: TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      )))
        : const SizedBox();

Widget _upSliverBorder(BuildContext context) => SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                  //elevation: 2  ,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8.0),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

Widget _downSliverBorder(BuildContext context) => SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                  elevation: 2,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(8.0),
                  ),
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(8.0),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

Widget _newSliverButton(BuildContext context, callback) => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: 48,
          alignment: Alignment.topLeft,
          color: Theme.of(context).colorScheme.surface,
          child: TextButton(
            onPressed: () => callNewPlayer(context, callback),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 52),
                child: Text('Новое',
                    style: myTextTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary)),
              ),
            ),
          ),
        ),
      ),
    );

void deletePlayerByIndex(BuildContext context, int index, callback) async {
  logs.writeLog('DELETE -> ${myTasks[index].show()}');
  myTasks.removeAt(index);

  //await Future.delayed(Duration(seconds: 2));
  callback();
}

void callNewPlayer(BuildContext context, callback) {
  logs.writeLog('TO ADD -> ${Task(id: myTasks.length).show()}');
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TaskEditorPage(
              thisTask: Task(id: myTasks.length),
              editMode: false))).then((value) {
    if (value != null) {
      myTasks.add(value);
      callback();
    }
  });
}
