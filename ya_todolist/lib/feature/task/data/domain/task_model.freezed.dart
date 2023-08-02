// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get text => throw _privateConstructorUsedError;
  @HiveField(2)
  Importance get importance => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(3)
  DateTime? get deadline => throw _privateConstructorUsedError; //optional
  @HiveField(4)
  bool get done => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(5)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(6)
  DateTime? get changedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated_by')
  @HiveField(7)
  String get lastUpdatedBy => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get color => throw _privateConstructorUsedError; //optional
  @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(9)
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) Importance importance,
      @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(3)
      DateTime? deadline,
      @HiveField(4) bool done,
      @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(5)
      DateTime? createdAt,
      @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(6)
      DateTime? changedAt,
      @JsonKey(name: 'last_updated_by') @HiveField(7) String lastUpdatedBy,
      @HiveField(8) String? color,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @HiveField(9)
      bool deleted});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

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
    Object? createdAt = freezed,
    Object? changedAt = freezed,
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
              as Importance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) Importance importance,
      @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(3)
      DateTime? deadline,
      @HiveField(4) bool done,
      @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(5)
      DateTime? createdAt,
      @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(6)
      DateTime? changedAt,
      @JsonKey(name: 'last_updated_by') @HiveField(7) String lastUpdatedBy,
      @HiveField(8) String? color,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @HiveField(9)
      bool deleted});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? lastUpdatedBy = null,
    Object? color = freezed,
    Object? deleted = null,
  }) {
    return _then(_$_Task(
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
              as Importance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'TaskAdapter')
class _$_Task extends _Task {
  const _$_Task(
      {@HiveField(0) this.id = '',
      @HiveField(1) this.text = '',
      @HiveField(2) this.importance = Importance.basic,
      @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(3)
      this.deadline,
      @HiveField(4) this.done = false,
      @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(5)
      this.createdAt,
      @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(6)
      this.changedAt,
      @JsonKey(name: 'last_updated_by') @HiveField(7) this.lastUpdatedBy = '',
      @HiveField(8) this.color = '#FFFFFF',
      @JsonKey(includeFromJson: false, includeToJson: false)
      @HiveField(9)
      this.deleted = false})
      : super._();

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

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
  final Importance importance;
  @override
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(3)
  final DateTime? deadline;
//optional
  @override
  @JsonKey()
  @HiveField(4)
  final bool done;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(5)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(6)
  final DateTime? changedAt;
  @override
  @JsonKey(name: 'last_updated_by')
  @HiveField(7)
  final String lastUpdatedBy;
  @override
  @JsonKey()
  @HiveField(8)
  final String? color;
//optional
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(9)
  final bool deleted;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, importance, deadline,
      done, createdAt, changedAt, lastUpdatedBy, color, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task extends Task {
  const factory _Task(
      {@HiveField(0) final String id,
      @HiveField(1) final String text,
      @HiveField(2) final Importance importance,
      @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(3)
      final DateTime? deadline,
      @HiveField(4) final bool done,
      @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(5)
      final DateTime? createdAt,
      @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
      @HiveField(6)
      final DateTime? changedAt,
      @JsonKey(name: 'last_updated_by')
      @HiveField(7)
      final String lastUpdatedBy,
      @HiveField(8) final String? color,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @HiveField(9)
      final bool deleted}) = _$_Task;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get text;
  @override
  @HiveField(2)
  Importance get importance;
  @override
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(3)
  DateTime? get deadline;
  @override //optional
  @HiveField(4)
  bool get done;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(5)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'changed_at', fromJson: dateFromJson, toJson: dateToJson)
  @HiveField(6)
  DateTime? get changedAt;
  @override
  @JsonKey(name: 'last_updated_by')
  @HiveField(7)
  String get lastUpdatedBy;
  @override
  @HiveField(8)
  String? get color;
  @override //optional
  @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(9)
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
