import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../task/data/domain/task_model.dart';
import '../bloc/editor_bloc.dart';
class PriorityChanger extends StatelessWidget {
  const PriorityChanger({super.key, required this.dropdownvalue});
  final Importance dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Importance>(
      tooltip: '',
      color: context.myColors!.backSecondary,
      initialValue: dropdownvalue,
      onSelected: (value) {
        context.editBloc!.add(EditorUpdatePriority(priority: value));
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
              style: MyTheme.myTextTheme.titleMedium!
                  .copyWith(color: context.myColors!.labelPrimary),
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
          style: MyTheme.myTextTheme.titleMedium!
              .copyWith(color: context.myColors!.tertiary));
    case Importance.low:
      return Text(AppLocalizations.of(context).priorityLow,
          style: MyTheme.myTextTheme.titleMedium!
              .copyWith(color: context.myColors!.labelPrimary));
    case Importance.important:
      return Text(AppLocalizations.of(context).priorityHigh,
          style: MyTheme.myTextTheme.titleMedium!
              .copyWith(color: context.myColors!.priority));
    default:
      return Text(AppLocalizations.of(context).priorityBasic,
          style: MyTheme.myTextTheme.titleMedium!
              .copyWith(color: context.myColors!.tertiary));
  }
}
