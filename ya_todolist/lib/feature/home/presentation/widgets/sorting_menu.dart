import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/feature/home/models/sorting_model.dart';
import 'package:ya_todolist/feature/task/bloc/tasks_bloc.dart';

class SortingMenu extends StatelessWidget {
  const SortingMenu({super.key, required this.currentValue});
  final SortingType currentValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortingType>(
      tooltip: '',
      splashRadius: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: context.myColors!.backSecondary,
      onSelected: (value) {
        context.taskBloc!.add(ChangeFilter(sortingType: value));
      },
      itemBuilder: (context) => drownButtonList(context, currentValue),
      icon: Icon(Icons.more_vert, color: context.myColors!.tertiary),
    );
  }
}

List<PopupMenuEntry<SortingType>> drownButtonList(
    BuildContext context, SortingType currentValue) {
  return [
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(hideDone: !currentValue.hideDone),
      child: priorityText(
          currentValue.hideDone ? 'showDone' : 'hideDone', context),
    ),
    PopupMenuItem<SortingType>(
      height: 1,
      padding: EdgeInsets.zero,
      enabled: false,
      value: currentValue.copyWith(isAscending: !currentValue.isAscending),
      child: Divider(
        height: 1,
        color: context.myColors!.tertiary,
      ),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(isAscending: !currentValue.isAscending),
      child:
          priorityText(currentValue.isAscending ? 'inDESC' : 'inASC', context),
    ),
    PopupMenuItem<SortingType>(
      padding: EdgeInsets.zero,
      height: 1,
      enabled: false,
      value: currentValue.copyWith(isAscending: !currentValue.isAscending),
      child: Divider(
        height: 1,
        color: context.myColors!.tertiary,
      ),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(type: SortType.changedAt),
      child: priorityText('byChangedAt', context),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(type: SortType.createdAt),
      child: priorityText('byCreatedAt', context),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(type: SortType.deadline),
      child: priorityText('byDeadline', context),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(type: SortType.text),
      child: priorityText('byText', context),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(type: SortType.importance),
      child: priorityText('byImportance', context),
    ),
    PopupMenuItem<SortingType>(
      value: currentValue.copyWith(type: SortType.done, hideDone: false),
      child: priorityText('byDone', context),
    )
  ];
}

Widget priorityText(String type, BuildContext context) {
  String title = '';
  switch (type) {
    case 'hideDone':
      title = AppLocalizations.of(context).filterHideDone;
    case 'showDone':
      title = AppLocalizations.of(context).filterShowDone;
    case 'inASC':
      title = AppLocalizations.of(context).filterSortASC;
    case 'inDESC':
      title = AppLocalizations.of(context).filterSortDESC;
    case 'byDeadline':
      title = AppLocalizations.of(context).filterSortByDeadline;
    case 'byChangedAt':
      title = AppLocalizations.of(context).filterSortByChangedAt;
    case 'byCreatedAt':
      title = AppLocalizations.of(context).filterSortByCreatedAt;
    case 'byText':
      title = AppLocalizations.of(context).filterSortByText;
    case 'byImportance':
      title = AppLocalizations.of(context).filterSortByImportance;
    case 'byDone':
      title = AppLocalizations.of(context).filterSortByDone;

    default:
      title = AppLocalizations.of(context).filterHideDone;
  }

  return Text(title,
      style: MyTheme.myTextTheme.titleMedium!
          .copyWith(color: context.myColors!.labelPrimary));
}
