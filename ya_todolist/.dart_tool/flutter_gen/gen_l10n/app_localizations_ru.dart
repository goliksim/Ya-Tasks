import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Мои дела';

  @override
  String get filterButton => 'Фильтр';

  @override
  String get editButton => 'Изменить';

  @override
  String get closeButton => 'Закрыть';

  @override
  String get newTaskField => 'Новое';

  @override
  String get tasksCompletedCount => 'Выполнено - ';

  @override
  String get addTask => 'Добавить';

  @override
  String get delete => 'Удалить';

  @override
  String get save => 'СОХРАНИТЬ';

  @override
  String get editorHintText => 'Что нужно сделать...';

  @override
  String get priority => 'Важность';

  @override
  String get priorityBasic => 'Нет';

  @override
  String get priorityLow => 'Низкая';

  @override
  String get priorityHigh => '!! Высокая';

  @override
  String get deadlineTitle => 'Сделать до';
}
