import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import '../../domain/entities/task_entitiy.dart';
import '../widgets/drown_button.dart';

class TaskEditorPage extends StatefulWidget {
  TaskEditorPage({super.key, required this.thisTask, required this.editMode});
  Task thisTask;
  bool editMode;

  @override
  State<TaskEditorPage> createState() => _TaskEditorPageState();
}

class _TaskEditorPageState extends State<TaskEditorPage> {
  String? dropdownvalue;
  String? text;
  bool deadline = false;

  late final Task tempTask;

  void updatePriority(String value) {
    setState(() {
      widget.thisTask.priority = value;
    });
  }

  @override
  void initState() {
    super.initState();
    tempTask = Task.clone(widget.thisTask);
    //dropdownvalue = 'Нет';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                ),
                child: Text('СОХРАНИТЬ',
                    textAlign: TextAlign.center, style: myTextTheme.button),
                onPressed: () {
                  if (widget.thisTask.text.isNotEmpty) {
                    Navigator.of(context).pop(widget.thisTask);
                  }
                },
              ),
            ),
          ),
        ],
        leading: IconButton(
          splashRadius: 24,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          //replace with our own icon data.
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: TextFormField(
                  initialValue: widget.thisTask.text,
                  //expands: true,
                  onChanged: (value) => (widget.thisTask.text = value),
                  decoration: InputDecoration(
                    hintStyle: myTextTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                    hintText: "Что нужно сделать...",
                    border: InputBorder.none,
                  ),
                  minLines: 3,
                  maxLines: 7,
                  style: myTextTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlignVertical: TextAlignVertical.bottom,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                myDropDownWindget(
                    context, widget.thisTask.priority, updatePriority),
                TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.zero,
                      ),
                    ),
                    onPressed: () async {
                      widget.thisTask.deadlineDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      widget.thisTask.deadline = true;
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 72,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Сделать до',
                                  style: myTextTheme.subtitle1!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                ),
                                //SizedBox(height: 4,),
                                Text(printDate(widget.thisTask.deadlineDate),
                                    style: myTextTheme.headline3!.copyWith(
                                        color: widget.thisTask.deadline
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .tertiary)),
                              ],
                            ),
                            Switch(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: widget.thisTask.deadline,
                                onChanged: (value) {
                                  widget.thisTask.deadline = value &&
                                      (widget.thisTask.deadlineDate != null);
                                  setState(() {});
                                }),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 8),
          TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              onPressed: () {
                if (widget.editMode) {
                  Navigator.of(context).pop('delete');
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.delete,
                          color: Theme.of(context).colorScheme.error),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Удалить',
                        style: myTextTheme.subtitle1!.copyWith(
                            color: Theme.of(context).colorScheme.error),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
