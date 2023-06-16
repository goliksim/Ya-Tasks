import 'dart:math';
import 'dart:ui';

//enum Priority { basic, low, important }

String printDate(DateTime? today) {
  return today == null
      ? " "
      : "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
}

List<Task> myTasks = [];

class Task {
  int id;
  String text;
  String? priority;
  DateTime? deadlineDate; //optional
  bool deadline;
  bool done;
  Color? color; //optionalX
  DateTime? createdAt;
  DateTime? changedAt;
  int? lastUpdatedBy;

  Task(
      {required this.id,
      this.text = '',
      this.priority = 'Нет',
      this.done = false,
      this.createdAt,
      this.changedAt,
      this.lastUpdatedBy,
      this.deadlineDate,
      this.deadline = false,
      this.color});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task && runtimeType == other.runtimeType && id == id;

  String show() {
    String result = '№ $id: ${text.substring(0, [
          text.length,
          10
        ].reduce(min))}.../done: $done${(deadlineDate == null) ? '' : '/dedline: $deadline! ${printDate(deadlineDate!)}'}';
    return result;
  }

  Task.clone(Task b)
      : this(
            id: b.id,
            text: b.text,
            priority: b.priority,
            done: b.done,
            createdAt: b.createdAt,
            lastUpdatedBy: b.lastUpdatedBy,
            deadline: b.deadline,
            color: b.color);

  Map toJson() => {
        'id': id,
        'text': text,
        'priority': priority,
        'done': done,
        'deadline': deadline,
        'deadlineDate': deadlineDate != null
            ? deadlineDate!.millisecondsSinceEpoch ~/ 1000
            : DateTime.now().millisecondsSinceEpoch ~/ 1000, //to unix timestamp
        //'color': color!
        //'created_at': createdAt.millisecondsSinceEpoch~/1000, //to unix timestamp
        //'changed_at': changedAt!.millisecondsSinceEpoch~/1000, //to unix timestamp
        //'last_updated_by': lastUpdatedBy,
      };
  //читаем из json
  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        priority = json['priority'],
        done = json['done'],
        deadline = json['deadline'],
        deadlineDate =
            DateTime.fromMillisecondsSinceEpoch(json['deadlineDate'] * 1000);
  //createdAt = DateTime.fromMillisecondsSinceEpoch(json['created_at']*1000), //from unix timestamp
  //changedAt = DateTime.fromMillisecondsSinceEpoch(json['changed_at']*1000), //from unix timestamp
  //lastUpdatedBy = json['last_updated_by'], //from unix timestamp
  //color = json['color'];

  @override
  int get hashCode => id.hashCode;
}
