// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoad value) load,
    required TResult Function(EditorUpdateText value) text,
    required TResult Function(EditorUpdatePriority value) priority,
    required TResult Function(EditorUpdateDeadline value) deadline,
    required TResult Function(EditorDeleteDeadline value) deleteDeadline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorEventCopyWith<$Res> {
  factory $EditorEventCopyWith(
          EditorEvent value, $Res Function(EditorEvent) then) =
      _$EditorEventCopyWithImpl<$Res, EditorEvent>;
}

/// @nodoc
class _$EditorEventCopyWithImpl<$Res, $Val extends EditorEvent>
    implements $EditorEventCopyWith<$Res> {
  _$EditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditorLoadCopyWith<$Res> {
  factory _$$EditorLoadCopyWith(
          _$EditorLoad value, $Res Function(_$EditorLoad) then) =
      __$$EditorLoadCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id, BuildContext context});
}

/// @nodoc
class __$$EditorLoadCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorLoad>
    implements _$$EditorLoadCopyWith<$Res> {
  __$$EditorLoadCopyWithImpl(
      _$EditorLoad _value, $Res Function(_$EditorLoad) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? context = null,
  }) {
    return _then(_$EditorLoad(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$EditorLoad implements EditorLoad {
  const _$EditorLoad({required this.id, required this.context});

  @override
  final String? id;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'EditorEvent.load(id: $id, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorLoad &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorLoadCopyWith<_$EditorLoad> get copyWith =>
      __$$EditorLoadCopyWithImpl<_$EditorLoad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
  }) {
    return load(id, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
  }) {
    return load?.call(id, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoad value) load,
    required TResult Function(EditorUpdateText value) text,
    required TResult Function(EditorUpdatePriority value) priority,
    required TResult Function(EditorUpdateDeadline value) deadline,
    required TResult Function(EditorDeleteDeadline value) deleteDeadline,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class EditorLoad implements EditorEvent {
  const factory EditorLoad(
      {required final String? id,
      required final BuildContext context}) = _$EditorLoad;

  String? get id;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$EditorLoadCopyWith<_$EditorLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorUpdateTextCopyWith<$Res> {
  factory _$$EditorUpdateTextCopyWith(
          _$EditorUpdateText value, $Res Function(_$EditorUpdateText) then) =
      __$$EditorUpdateTextCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$EditorUpdateTextCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorUpdateText>
    implements _$$EditorUpdateTextCopyWith<$Res> {
  __$$EditorUpdateTextCopyWithImpl(
      _$EditorUpdateText _value, $Res Function(_$EditorUpdateText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$EditorUpdateText(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditorUpdateText implements EditorUpdateText {
  const _$EditorUpdateText({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'EditorEvent.text(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorUpdateText &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorUpdateTextCopyWith<_$EditorUpdateText> get copyWith =>
      __$$EditorUpdateTextCopyWithImpl<_$EditorUpdateText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoad value) load,
    required TResult Function(EditorUpdateText value) text,
    required TResult Function(EditorUpdatePriority value) priority,
    required TResult Function(EditorUpdateDeadline value) deadline,
    required TResult Function(EditorDeleteDeadline value) deleteDeadline,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class EditorUpdateText implements EditorEvent {
  const factory EditorUpdateText({required final String text}) =
      _$EditorUpdateText;

  String get text;
  @JsonKey(ignore: true)
  _$$EditorUpdateTextCopyWith<_$EditorUpdateText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorUpdatePriorityCopyWith<$Res> {
  factory _$$EditorUpdatePriorityCopyWith(_$EditorUpdatePriority value,
          $Res Function(_$EditorUpdatePriority) then) =
      __$$EditorUpdatePriorityCopyWithImpl<$Res>;
  @useResult
  $Res call({Importance priority});
}

/// @nodoc
class __$$EditorUpdatePriorityCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorUpdatePriority>
    implements _$$EditorUpdatePriorityCopyWith<$Res> {
  __$$EditorUpdatePriorityCopyWithImpl(_$EditorUpdatePriority _value,
      $Res Function(_$EditorUpdatePriority) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priority = null,
  }) {
    return _then(_$EditorUpdatePriority(
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Importance,
    ));
  }
}

/// @nodoc

class _$EditorUpdatePriority implements EditorUpdatePriority {
  const _$EditorUpdatePriority({required this.priority});

  @override
  final Importance priority;

  @override
  String toString() {
    return 'EditorEvent.priority(priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorUpdatePriority &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorUpdatePriorityCopyWith<_$EditorUpdatePriority> get copyWith =>
      __$$EditorUpdatePriorityCopyWithImpl<_$EditorUpdatePriority>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
  }) {
    return priority(this.priority);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
  }) {
    return priority?.call(this.priority);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    required TResult orElse(),
  }) {
    if (priority != null) {
      return priority(this.priority);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoad value) load,
    required TResult Function(EditorUpdateText value) text,
    required TResult Function(EditorUpdatePriority value) priority,
    required TResult Function(EditorUpdateDeadline value) deadline,
    required TResult Function(EditorDeleteDeadline value) deleteDeadline,
  }) {
    return priority(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
  }) {
    return priority?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    required TResult orElse(),
  }) {
    if (priority != null) {
      return priority(this);
    }
    return orElse();
  }
}

abstract class EditorUpdatePriority implements EditorEvent {
  const factory EditorUpdatePriority({required final Importance priority}) =
      _$EditorUpdatePriority;

  Importance get priority;
  @JsonKey(ignore: true)
  _$$EditorUpdatePriorityCopyWith<_$EditorUpdatePriority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorUpdateDeadlineCopyWith<$Res> {
  factory _$$EditorUpdateDeadlineCopyWith(_$EditorUpdateDeadline value,
          $Res Function(_$EditorUpdateDeadline) then) =
      __$$EditorUpdateDeadlineCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime deadline});
}

/// @nodoc
class __$$EditorUpdateDeadlineCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorUpdateDeadline>
    implements _$$EditorUpdateDeadlineCopyWith<$Res> {
  __$$EditorUpdateDeadlineCopyWithImpl(_$EditorUpdateDeadline _value,
      $Res Function(_$EditorUpdateDeadline) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deadline = null,
  }) {
    return _then(_$EditorUpdateDeadline(
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$EditorUpdateDeadline implements EditorUpdateDeadline {
  const _$EditorUpdateDeadline({required this.deadline});

  @override
  final DateTime deadline;

  @override
  String toString() {
    return 'EditorEvent.deadline(deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorUpdateDeadline &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorUpdateDeadlineCopyWith<_$EditorUpdateDeadline> get copyWith =>
      __$$EditorUpdateDeadlineCopyWithImpl<_$EditorUpdateDeadline>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
  }) {
    return deadline(this.deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
  }) {
    return deadline?.call(this.deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    required TResult orElse(),
  }) {
    if (deadline != null) {
      return deadline(this.deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoad value) load,
    required TResult Function(EditorUpdateText value) text,
    required TResult Function(EditorUpdatePriority value) priority,
    required TResult Function(EditorUpdateDeadline value) deadline,
    required TResult Function(EditorDeleteDeadline value) deleteDeadline,
  }) {
    return deadline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
  }) {
    return deadline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    required TResult orElse(),
  }) {
    if (deadline != null) {
      return deadline(this);
    }
    return orElse();
  }
}

abstract class EditorUpdateDeadline implements EditorEvent {
  const factory EditorUpdateDeadline({required final DateTime deadline}) =
      _$EditorUpdateDeadline;

  DateTime get deadline;
  @JsonKey(ignore: true)
  _$$EditorUpdateDeadlineCopyWith<_$EditorUpdateDeadline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorDeleteDeadlineCopyWith<$Res> {
  factory _$$EditorDeleteDeadlineCopyWith(_$EditorDeleteDeadline value,
          $Res Function(_$EditorDeleteDeadline) then) =
      __$$EditorDeleteDeadlineCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditorDeleteDeadlineCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorDeleteDeadline>
    implements _$$EditorDeleteDeadlineCopyWith<$Res> {
  __$$EditorDeleteDeadlineCopyWithImpl(_$EditorDeleteDeadline _value,
      $Res Function(_$EditorDeleteDeadline) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditorDeleteDeadline implements EditorDeleteDeadline {
  const _$EditorDeleteDeadline();

  @override
  String toString() {
    return 'EditorEvent.deleteDeadline()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditorDeleteDeadline);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
  }) {
    return deleteDeadline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
  }) {
    return deleteDeadline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    required TResult orElse(),
  }) {
    if (deleteDeadline != null) {
      return deleteDeadline();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoad value) load,
    required TResult Function(EditorUpdateText value) text,
    required TResult Function(EditorUpdatePriority value) priority,
    required TResult Function(EditorUpdateDeadline value) deadline,
    required TResult Function(EditorDeleteDeadline value) deleteDeadline,
  }) {
    return deleteDeadline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
  }) {
    return deleteDeadline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    required TResult orElse(),
  }) {
    if (deleteDeadline != null) {
      return deleteDeadline(this);
    }
    return orElse();
  }
}

abstract class EditorDeleteDeadline implements EditorEvent {
  const factory EditorDeleteDeadline() = _$EditorDeleteDeadline;
}

/// @nodoc
mixin _$EditorState {
  Task get task => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, bool editMode) initial,
    required TResult Function(bool editMode, Task task) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, bool editMode)? initial,
    TResult? Function(bool editMode, Task task)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, bool editMode)? initial,
    TResult Function(bool editMode, Task task)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditorStateCopyWith<EditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorStateCopyWith<$Res> {
  factory $EditorStateCopyWith(
          EditorState value, $Res Function(EditorState) then) =
      _$EditorStateCopyWithImpl<$Res, EditorState>;
  @useResult
  $Res call({Task task, bool editMode});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$EditorStateCopyWithImpl<$Res, $Val extends EditorState>
    implements $EditorStateCopyWith<$Res> {
  _$EditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? editMode = null,
  }) {
    return _then(_value.copyWith(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditorStateInitialCopyWith<$Res>
    implements $EditorStateCopyWith<$Res> {
  factory _$$EditorStateInitialCopyWith(_$EditorStateInitial value,
          $Res Function(_$EditorStateInitial) then) =
      __$$EditorStateInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task, bool editMode});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$EditorStateInitialCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateInitial>
    implements _$$EditorStateInitialCopyWith<$Res> {
  __$$EditorStateInitialCopyWithImpl(
      _$EditorStateInitial _value, $Res Function(_$EditorStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? editMode = null,
  }) {
    return _then(_$EditorStateInitial(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditorStateInitial implements EditorStateInitial {
  const _$EditorStateInitial({required this.task, required this.editMode});

  @override
  final Task task;
  @override
  final bool editMode;

  @override
  String toString() {
    return 'EditorState.initial(task: $task, editMode: $editMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateInitial &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, editMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateInitialCopyWith<_$EditorStateInitial> get copyWith =>
      __$$EditorStateInitialCopyWithImpl<_$EditorStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, bool editMode) initial,
    required TResult Function(bool editMode, Task task) loaded,
  }) {
    return initial(task, editMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, bool editMode)? initial,
    TResult? Function(bool editMode, Task task)? loaded,
  }) {
    return initial?.call(task, editMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, bool editMode)? initial,
    TResult Function(bool editMode, Task task)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(task, editMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class EditorStateInitial implements EditorState {
  const factory EditorStateInitial(
      {required final Task task,
      required final bool editMode}) = _$EditorStateInitial;

  @override
  Task get task;
  @override
  bool get editMode;
  @override
  @JsonKey(ignore: true)
  _$$EditorStateInitialCopyWith<_$EditorStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorStateLoadedCopyWith<$Res>
    implements $EditorStateCopyWith<$Res> {
  factory _$$EditorStateLoadedCopyWith(
          _$EditorStateLoaded value, $Res Function(_$EditorStateLoaded) then) =
      __$$EditorStateLoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool editMode, Task task});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$EditorStateLoadedCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateLoaded>
    implements _$$EditorStateLoadedCopyWith<$Res> {
  __$$EditorStateLoadedCopyWithImpl(
      _$EditorStateLoaded _value, $Res Function(_$EditorStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? task = null,
  }) {
    return _then(_$EditorStateLoaded(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$EditorStateLoaded implements EditorStateLoaded {
  const _$EditorStateLoaded({required this.editMode, required this.task});

  @override
  final bool editMode;
  @override
  final Task task;

  @override
  String toString() {
    return 'EditorState.loaded(editMode: $editMode, task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateLoaded &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editMode, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      __$$EditorStateLoadedCopyWithImpl<_$EditorStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, bool editMode) initial,
    required TResult Function(bool editMode, Task task) loaded,
  }) {
    return loaded(editMode, task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, bool editMode)? initial,
    TResult? Function(bool editMode, Task task)? loaded,
  }) {
    return loaded?.call(editMode, task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, bool editMode)? initial,
    TResult Function(bool editMode, Task task)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(editMode, task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EditorStateLoaded implements EditorState {
  const factory EditorStateLoaded(
      {required final bool editMode,
      required final Task task}) = _$EditorStateLoaded;

  @override
  bool get editMode;
  @override
  Task get task;
  @override
  @JsonKey(ignore: true)
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
