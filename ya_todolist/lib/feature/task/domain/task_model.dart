import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Importance { basic, low, important }

Importance enumDecode(String code) {
  switch (code) {
    case 'basic':
      return Importance.basic;
    case 'low':
      return Importance.low;
    case 'important':
      return Importance.important;
    default:
      return Importance.basic;
  }
}

String enumEncode(Importance priority) {
  switch (priority) {
    case Importance.basic:
      return 'basic';
    case Importance.low:
      return 'low';
    case Importance.important:
      return 'important';
    default:
      return 'basic';
  }
}

//List<Task> myTasks = [];

class Task extends Equatable {
  final String id;
  final String text;
  final Importance importance;
  final DateTime? deadline; //optional
  final bool done;
  final DateTime? createdAt;
  final DateTime? changedAt;
  final String lastUpdatedBy;
  final Color? color; //optionalX

  Task({
    String? id,
    this.text = '',
    this.importance = Importance.basic,
    this.done = false,
    this.deadline,
    DateTime? createdAt,
    DateTime? changedAt,
    this.lastUpdatedBy = '123',
    this.color,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        changedAt = createdAt ?? DateTime.now(),
        super();

  String show() {
    String result = '№ $id: ${text.substring(0, [
          text.length,
          10
        ].reduce(min))}.../done: $done${(deadline == null) ? '' : '/dedlineDate: ${deadline!}'}';
    return result;
  }

  Task copyWith({
    String? id,
    String? text,
    Importance? priority,
    bool? done,
    DateTime? deadline,
    bool? deleteDeadline,
  }) {
    return Task(
      id: id ?? this.id,
      text: text ?? this.text,
      importance: priority ?? importance,
      done: done ?? this.done,
      deadline: deleteDeadline ?? false ? null : deadline ?? this.deadline,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'importance': enumEncode(importance),
        'done': done,
        'deadline': (deadline != null)
            ? deadline!.millisecondsSinceEpoch ~/ 1000
            : null, //to unix timestamp
        'color': 'fff', //color! ,
        'created_at':
            createdAt!.millisecondsSinceEpoch ~/ 1000, //to unix timestamp
        'changed_at':
            changedAt!.millisecondsSinceEpoch ~/ 1000, //to unix timestamp
        'last_updated_by': lastUpdatedBy,
      };

  //читаем из json
  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        importance = enumDecode(json['importance']),
        done = json['done'],
        deadline = (json['deadline'] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['deadline'] * 1000),
        createdAt = DateTime.fromMillisecondsSinceEpoch(
            json['created_at'] * 1000), //from unix timestamp
        changedAt = DateTime.fromMillisecondsSinceEpoch(
            json['changed_at'] * 1000), //from unix timestamp
        lastUpdatedBy = json['last_updated_by'], //from unix timestamp
        color = Colors.red; //json['color'];

  @override
  List<Object?> get props => [
        id,
        text,
        importance,
        done,
        deadline,
        createdAt,
        changedAt,
        lastUpdatedBy,
        color
      ];
}
