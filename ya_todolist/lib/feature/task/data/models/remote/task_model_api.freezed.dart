// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskApiModel _$TaskApiModelFromJson(Map<String, dynamic> json) {
  return _TaskApiModel.fromJson(json);
}

/// @nodoc
mixin _$TaskApiModel {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Importance get importance => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime? get deadline => throw _privateConstructorUsedError; //optional
  bool get done => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError; //optional
  @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime? get changedAt => throw _privateConstructorUsedError; //optional
  @JsonKey(name: 'last_updated_by')
  String get lastUpdatedBy => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError; //optional
  @JsonKey(includeFromJson: true, includeToJson: false)
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskApiModelCopyWith<TaskApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskApiModelCopyWith<$Res> {
  factory $TaskApiModelCopyWith(
          TaskApiModel value, $Res Function(TaskApiModel) then) =
      _$TaskApiModelCopyWithImpl<$Res, TaskApiModel>;
  @useResult
  $Res call(
      {String id,
      String text,
      Importance importance,
      @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime? deadline,
      bool done,
      @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
      DateTime? createdAt,
      @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
      DateTime? changedAt,
      @JsonKey(name: 'last_updated_by') String lastUpdatedBy,
      String? color,
      @JsonKey(includeFromJson: true, includeToJson: false) bool deleted});
}

/// @nodoc
class _$TaskApiModelCopyWithImpl<$Res, $Val extends TaskApiModel>
    implements $TaskApiModelCopyWith<$Res> {
  _$TaskApiModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_TaskApiModelCopyWith<$Res>
    implements $TaskApiModelCopyWith<$Res> {
  factory _$$_TaskApiModelCopyWith(
          _$_TaskApiModel value, $Res Function(_$_TaskApiModel) then) =
      __$$_TaskApiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      Importance importance,
      @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime? deadline,
      bool done,
      @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
      DateTime? createdAt,
      @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
      DateTime? changedAt,
      @JsonKey(name: 'last_updated_by') String lastUpdatedBy,
      String? color,
      @JsonKey(includeFromJson: true, includeToJson: false) bool deleted});
}

/// @nodoc
class __$$_TaskApiModelCopyWithImpl<$Res>
    extends _$TaskApiModelCopyWithImpl<$Res, _$_TaskApiModel>
    implements _$$_TaskApiModelCopyWith<$Res> {
  __$$_TaskApiModelCopyWithImpl(
      _$_TaskApiModel _value, $Res Function(_$_TaskApiModel) _then)
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
    return _then(_$_TaskApiModel(
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
class _$_TaskApiModel implements _TaskApiModel {
  const _$_TaskApiModel(
      {this.id = '',
      this.text = '',
      this.importance = Importance.basic,
      @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) this.deadline,
      this.done = false,
      @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
      this.createdAt,
      @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
      this.changedAt,
      @JsonKey(name: 'last_updated_by') this.lastUpdatedBy = '',
      this.color = '#FFFFFF',
      @JsonKey(includeFromJson: true, includeToJson: false)
      this.deleted = false});

  factory _$_TaskApiModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskApiModelFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final Importance importance;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime? deadline;
//optional
  @override
  @JsonKey()
  final bool done;
  @override
  @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime? createdAt;
//optional
  @override
  @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime? changedAt;
//optional
  @override
  @JsonKey(name: 'last_updated_by')
  final String lastUpdatedBy;
  @override
  @JsonKey()
  final String? color;
//optional
  @override
  @JsonKey(includeFromJson: true, includeToJson: false)
  final bool deleted;

  @override
  String toString() {
    return 'TaskApiModel(id: $id, text: $text, importance: $importance, deadline: $deadline, done: $done, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy, color: $color, deleted: $deleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskApiModel &&
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
  _$$_TaskApiModelCopyWith<_$_TaskApiModel> get copyWith =>
      __$$_TaskApiModelCopyWithImpl<_$_TaskApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskApiModelToJson(
      this,
    );
  }
}

abstract class _TaskApiModel implements TaskApiModel {
  const factory _TaskApiModel(
      {final String id,
      final String text,
      final Importance importance,
      @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
      final DateTime? deadline,
      final bool done,
      @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
      final DateTime? createdAt,
      @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
      final DateTime? changedAt,
      @JsonKey(name: 'last_updated_by') final String lastUpdatedBy,
      final String? color,
      @JsonKey(includeFromJson: true, includeToJson: false)
      final bool deleted}) = _$_TaskApiModel;

  factory _TaskApiModel.fromJson(Map<String, dynamic> json) =
      _$_TaskApiModel.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  Importance get importance;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime? get deadline;
  @override //optional
  bool get done;
  @override
  @JsonKey(name: 'created_at', fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime? get createdAt;
  @override //optional
  @JsonKey(name: 'changed_at', fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime? get changedAt;
  @override //optional
  @JsonKey(name: 'last_updated_by')
  String get lastUpdatedBy;
  @override
  String? get color;
  @override //optional
  @JsonKey(includeFromJson: true, includeToJson: false)
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$_TaskApiModelCopyWith<_$_TaskApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
