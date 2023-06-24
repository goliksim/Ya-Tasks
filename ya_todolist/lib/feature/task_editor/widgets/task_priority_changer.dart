import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../task/domain/task_entitiy.dart';
import '../bloc/editor_bloc.dart';
import '../bloc/editor_events.dart';

class PriorityChanger extends StatelessWidget {
  const PriorityChanger({super.key, required this.dropdownvalue});
  final Importance dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Importance>(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      initialValue: dropdownvalue,
      onSelected: (value) {
        BlocProvider.of<EditorBloc>(context)
            .add(EditorUpdatePriority(priority: value));
      },
      itemBuilder: (context) => drownButtonList(context),
      child: Container(
        height: 72,
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).priority,
              style: myTextTheme.subtitle1!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            priorityText(dropdownvalue, context),
          ],
        ),
      ),
    );
  }
}

List<PopupMenuEntry<Importance>> drownButtonList(BuildContext context) {
  return [
    PopupMenuItem<Importance>(
      value: Importance.basic,
      child: priorityText(Importance.basic, context),
    ),
    PopupMenuItem<Importance>(
      value: Importance.low,
      child: priorityText(Importance.low, context),
    ),
    PopupMenuItem<Importance>(
      value: Importance.important,
      child: priorityText(Importance.important, context),
    )
  ];
}

Widget priorityText(Importance priority, BuildContext context) {
  switch (priority) {
    case Importance.basic:
      return Text(AppLocalizations.of(context).priorityBasic,
          style: myTextTheme.subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.tertiary));
    case Importance.low:
      return Text(AppLocalizations.of(context).priorityLow,
          style: myTextTheme.subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.onBackground));
    case Importance.important:
      return Text(AppLocalizations.of(context).priorityHigh,
          style: myTextTheme.subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.error));
    default:
      return Text(AppLocalizations.of(context).priorityBasic,
          style: myTextTheme.subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.tertiary));
  }
}
