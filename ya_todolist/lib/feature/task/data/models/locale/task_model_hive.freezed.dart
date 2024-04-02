// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model_hive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskHiveModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get text => throw _privateConstructorUsedError;
  @HiveField(2)
  HiveImportance get importance => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get deadline => throw _privateConstructorUsedError; //optional
  @HiveField(4)
  bool get done => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get changedAt => throw _privateConstructorUsedError;
  @HiveField(7)
  String get lastUpdatedBy => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get color => throw _privateConstructorUsedError; //optional
  @HiveField(9)
  bool get deleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskHiveModelCopyWith<TaskHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskHiveModelCopyWith<$Res> {
  factory $TaskHiveModelCopyWith(
          TaskHiveModel value, $Res Function(TaskHiveModel) then) =
      _$TaskHiveModelCopyWithImpl<$Res, TaskHiveModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) HiveImportance importance,
      @HiveField(3) DateTime? deadline,
      @HiveField(4) bool done,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime changedAt,
      @HiveField(7) String lastUpdatedBy,
      @HiveField(8) String? color,
      @HiveField(9) bool deleted});
}

/// @nodoc
class _$TaskHiveModelCopyWithImpl<$Res, $Val extends TaskHiveModel>
    implements $TaskHiveModelCopyWith<$Res> {
  _$TaskHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
    Object? color = freezed,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as HiveImportance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskHiveModelCopyWith<$Res>
    implements $TaskHiveModelCopyWith<$Res> {
  factory _$$_TaskHiveModelCopyWith(
          _$_TaskHiveModel value, $Res Function(_$_TaskHiveModel) then) =
      __$$_TaskHiveModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) HiveImportance importance,
      @HiveField(3) DateTime? deadline,
      @HiveField(4) bool done,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime changedAt,
      @HiveField(7) String lastUpdatedBy,
      @HiveField(8) String? color,
      @HiveField(9) bool deleted});
}

/// @nodoc
class __$$_TaskHiveModelCopyWithImpl<$Res>
    extends _$TaskHiveModelCopyWithImpl<$Res, _$_TaskHiveModel>
    implements _$$_TaskHiveModelCopyWith<$Res> {
  __$$_TaskHiveModelCopyWithImpl(
      _$_TaskHiveModel _value, $Res Function(_$_TaskHiveModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
    Object? color = freezed,
    Object? deleted = null,
  }) {
    return _then(_$_TaskHiveModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as HiveImportance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'TaskAdapter')
class _$_TaskHiveModel implements _TaskHiveModel {
  const _$_TaskHiveModel(
      {@HiveField(0) this.id = '',
      @HiveField(1) this.text = '',
      @HiveField(2) this.importance = HiveImportance.basic,
      @HiveField(3) this.deadline,
      @HiveField(4) this.done = false,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.changedAt,
      @HiveField(7) this.lastUpdatedBy = '',
      @HiveField(8) this.color = '#FFFFFF',
      @HiveField(9) this.deleted = false});

  @override
  @JsonKey()
  @HiveField(0)
  final String id;
  @override
  @JsonKey()
  @HiveField(1)
  final String text;
  @override
  @JsonKey()
  @HiveField(2)
  final HiveImportance importance;
  @override
  @HiveField(3)
  final DateTime? deadline;
//optional
  @override
  @JsonKey()
  @HiveField(4)
  final bool done;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime changedAt;
  @override
  @JsonKey()
  @HiveField(7)
  final String lastUpdatedBy;
  @override
  @JsonKey()
  @HiveField(8)
  final String? color;
//optional
  @override
  @JsonKey()
  @HiveField(9)
  final bool deleted;

  @override
  String toString() {
    return 'TaskHiveModel(id: $id, text: $text, importance: $importance, deadline: $deadline, done: $done, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy, color: $color, deleted: $deleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskHiveModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, importance, deadline,
      done, createdAt, changedAt, lastUpdatedBy, color, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskHiveModelCopyWith<_$_TaskHiveModel> get copyWith =>
      __$$_TaskHiveModelCopyWithImpl<_$_TaskHiveModel>(this, _$identity);
}

abstract class _TaskHiveModel implements TaskHiveModel {
  const factory _TaskHiveModel(
      {@HiveField(0) final String id,
      @HiveField(1) final String text,
      @HiveField(2) final HiveImportance importance,
      @HiveField(3) final DateTime? deadline,
      @HiveField(4) final bool done,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) required final DateTime changedAt,
      @HiveField(7) final String lastUpdatedBy,
      @HiveField(8) final String? color,
      @HiveField(9) final bool deleted}) = _$_TaskHiveModel;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get text;
  @override
  @HiveField(2)
  HiveImportance get importance;
  @override
  @HiveField(3)
  DateTime? get deadline;
  @override //optional
  @HiveField(4)
  bool get done;
  @override
  @HiveField(5)
  DateTime get createdAt;
  @override
  @HiveField(6)
  DateTime get changedAt;
  @override
  @HiveField(7)
  String get lastUpdatedBy;
  @override
  @HiveField(8)
  String? get color;
  @override //optional
  @HiveField(9)
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$_TaskHiveModelCopyWith<_$_TaskHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
