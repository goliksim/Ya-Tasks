import 'package:ya_todolist/feature/task/domain/models/task_entity.dart';

extension BoolCompareTo on bool {
  int compareTo(bool other) {
    if (this == other) {
      return 0;
    } else if (this) {
      return 1;
    } else {
      return -1;
    }
  }
}

DateTime _dateMin = DateTime.utc(0, 0, 0);
DateTime _dateMax = DateTime.utc(9999, 12, 31);

//TODO DELETE BANG OPERATOR !
List<Task> sortByDeadline(List<Task> tasks, bool ascending) {
  if (!ascending) {
    tasks.sort(
        (a, b) => (a.deadline ?? _dateMax).compareTo(b.deadline ?? _dateMax));
  } else {
    tasks.sort(
        (a, b) => (b.deadline ?? _dateMin).compareTo(a.deadline ?? _dateMin));
  }
  return tasks;
}

List<Task> sortByChangedAt(List<Task> tasks, bool ascending) {
  if (!ascending) {
    tasks.sort(
        (a, b) => (a.changedAt ?? _dateMax).compareTo(b.changedAt ?? _dateMax));
  } else {
    tasks.sort(
        (a, b) => (b.changedAt ?? _dateMin).compareTo(a.changedAt ?? _dateMin));
  }
  return tasks;
}

List<Task> sortByCreatedAt(List<Task> tasks, bool ascending) {
  if (ascending) {
    tasks.sort(
        (a, b) => (a.createdAt ?? _dateMax).compareTo(b.createdAt ?? _dateMax));
  } else {
    tasks.sort(
        (a, b) => (b.createdAt ?? _dateMin).compareTo(a.createdAt ?? _dateMin));
  }
  return tasks;
}

List<Task> sortByiImportance(List<Task> tasks, bool ascending) {
  if (ascending) {
    tasks.sort((a, b) => a.importance.index.compareTo(b.importance.index));
  } else {
    tasks.sort((a, b) => b.importance.index.compareTo(a.importance.index));
  }
  return tasks;
}

List<Task> sortByText(List<Task> tasks, bool ascending) {
  if (ascending) {
    tasks.sort((a, b) => a.text.toLowerCase().compareTo(b.text.toLowerCase()));
  } else {
    tasks.sort((a, b) => b.text.toLowerCase().compareTo(a.text.toLowerCase()));
  }
  return tasks;
}

List<Task> sortByDone(List<Task> tasks, bool ascending) {
  if (ascending) {
    tasks.sort((a, b) =>
        2 * a.done.compareTo(b.done) + a.changedAt!.compareTo(b.changedAt!));
  } else {
    tasks.sort((a, b) =>
        2 * b.done.compareTo(a.done) + a.changedAt!.compareTo(b.changedAt!));
  }
  return tasks;
}
