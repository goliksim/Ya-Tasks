import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/editor_bloc.dart';
import '../bloc/editor_events.dart';

class DeadLineSwitch extends StatefulWidget {
  const DeadLineSwitch({super.key, required this.deadlineDate});

  final DateTime? deadlineDate;

  @override
  State<DeadLineSwitch> createState() => _DeadLineSwitchState();
}

class _DeadLineSwitchState extends State<DeadLineSwitch> {
  void updateDeadline(BuildContext context, [bool delete = false]) async {
    if (!delete) {
      DateTime today = DateTime.now();
      showDatePicker(
        context: context,
        initialDate:
            BlocProvider.of<EditorBloc>(context).state.task.deadline ?? today,
        firstDate: today,
        lastDate: today.add(const Duration(days: 365 * 100)),
      ).then(
        (value) {
          if (value != null) {
            BlocProvider.of<EditorBloc>(context)
                .add(EditorUpdateDeadline(deadline: value));
          }
        },
      );
    } else {
      BlocProvider.of<EditorBloc>(context).add(const EditorDeleteDeadline());
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: context.myColors!.tertiary,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
      ),
      onPressed: () async {
        updateDeadline(context);
      },
      child: SizedBox(
        height: 72,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Deadline text
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).deadlineTitle,
                    style: MyTheme.myTextTheme.subtitle1!
                        .copyWith(color: context.myColors!.labelPrimary),
                  ),
                  //SizedBox(height: 4,),
                  if (widget.deadlineDate != null)
                    Text(
                      DateFormat.yMMMMd(AppLocalizations.of(context).localeName)
                          .format(widget.deadlineDate!), //date
                      style: MyTheme.myTextTheme.headline3!.copyWith(
                        color: context.myColors!.blue,
                      ),
                    ),
                ],
              ),
              // Deadline switch
              Switch(
                activeColor: context.myColors!.blue,
                inactiveThumbColor: context.myColors!.backSecondary,
                value: widget.deadlineDate != null,
                onChanged: (value) async {
                  updateDeadline(context, !value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
