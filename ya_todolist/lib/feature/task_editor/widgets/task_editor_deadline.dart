import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:ya_todolist/common/utils.dart';
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
        foregroundColor: Theme.of(context).colorScheme.tertiary,
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
                    style: myTextTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  //SizedBox(height: 4,),
                  if (widget.deadlineDate != null)
                    Text(
                      printDate(widget.deadlineDate),
                      style: myTextTheme.headline3!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                ],
              ),
              // Deadline switch
              Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveThumbColor:
                    Theme.of(context).colorScheme.onSurfaceVariant,
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
