import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'My tasks';

  @override
  String get filterButton => 'Filter';

  @override
  String get editButton => 'Edit';

  @override
  String get closeButton => 'Close';

  @override
  String get newTaskField => 'New';

  @override
  String get tasksCompletedCount => 'Completed - ';

  @override
  String get addTask => 'New';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'SAVE';

  @override
  String get editorHintText => 'Need to do...';

  @override
  String get priority => 'Priority';

  @override
  String get priorityBasic => 'No';

  @override
  String get priorityLow => 'Low';

  @override
  String get priorityHigh => '!! High';

  @override
  String get deadlineTitle => 'Do untill';
}
