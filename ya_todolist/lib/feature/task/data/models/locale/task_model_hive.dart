import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'task_model_hive.g.dart';
part 'task_model_hive.freezed.dart';

@HiveType(typeId: 2)
enum HiveImportance {
  @HiveField(0)
  basic,
  @HiveField(1)
  low,
  @HiveField(2)
  important
}

@freezed
class TaskHiveModel with _$TaskHiveModel {
  @HiveType(typeId: 1, adapterName: 'TaskAdapter')
  const factory TaskHiveModel({
    @HiveField(0) @Default('') String id,
    @HiveField(1) @Default('') String text,
    @HiveField(2) @Default(HiveImportance.basic) HiveImportance importance,
    @HiveField(3) DateTime? deadline, //optional
    @HiveField(4) @Default(false) bool done,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime changedAt,
    @Default('') @HiveField(7) String lastUpdatedBy,
    @HiveField(8) @Default('#FFFFFF') String? color, //optional
    @HiveField(9) @Default(false) bool deleted,
  }) = _TaskHiveModel;
}

//Тут мог быть JsonConverter, но он отказывается работать с hive ¯\_(⊙_⊙)_/¯
