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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
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
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
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
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
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
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
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
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
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
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
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
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
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
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
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
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
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
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
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
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
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
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
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
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
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
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
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
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
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
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
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
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
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
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
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
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
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
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
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
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
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
abstract class _$$EditorSaverCopyWith<$Res> {
  factory _$$EditorSaverCopyWith(
          _$EditorSaver value, $Res Function(_$EditorSaver) then) =
      __$$EditorSaverCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$EditorSaverCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorSaver>
    implements _$$EditorSaverCopyWith<$Res> {
  __$$EditorSaverCopyWithImpl(
      _$EditorSaver _value, $Res Function(_$EditorSaver) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$EditorSaver(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$EditorSaver implements EditorSaver {
  const _$EditorSaver({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'EditorEvent.save(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorSaver &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorSaverCopyWith<_$EditorSaver> get copyWith =>
      __$$EditorSaverCopyWithImpl<_$EditorSaver>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
  }) {
    return save(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
  }) {
    return save?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(context);
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class EditorSaver implements EditorEvent {
  const factory EditorSaver({required final BuildContext context}) =
      _$EditorSaver;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$EditorSaverCopyWith<_$EditorSaver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorRemoverCopyWith<$Res> {
  factory _$$EditorRemoverCopyWith(
          _$EditorRemover value, $Res Function(_$EditorRemover) then) =
      __$$EditorRemoverCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$EditorRemoverCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorRemover>
    implements _$$EditorRemoverCopyWith<$Res> {
  __$$EditorRemoverCopyWithImpl(
      _$EditorRemover _value, $Res Function(_$EditorRemover) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$EditorRemover(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$EditorRemover implements EditorRemover {
  const _$EditorRemover({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'EditorEvent.deleteTask(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorRemover &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorRemoverCopyWith<_$EditorRemover> get copyWith =>
      __$$EditorRemoverCopyWithImpl<_$EditorRemover>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, BuildContext context) load,
    required TResult Function(String text) text,
    required TResult Function(Importance priority) priority,
    required TResult Function(DateTime deadline) deadline,
    required TResult Function() deleteDeadline,
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
  }) {
    return deleteTask(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
  }) {
    return deleteTask?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(context);
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
  }) {
    return deleteTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class EditorRemover implements EditorEvent {
  const factory EditorRemover({required final BuildContext context}) =
      _$EditorRemover;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$EditorRemoverCopyWith<_$EditorRemover> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorResetCopyWith<$Res> {
  factory _$$EditorResetCopyWith(
          _$EditorReset value, $Res Function(_$EditorReset) then) =
      __$$EditorResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditorResetCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$EditorReset>
    implements _$$EditorResetCopyWith<$Res> {
  __$$EditorResetCopyWithImpl(
      _$EditorReset _value, $Res Function(_$EditorReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditorReset implements EditorReset {
  const _$EditorReset();

  @override
  String toString() {
    return 'EditorEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditorReset);
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
    required TResult Function(BuildContext context) save,
    required TResult Function(BuildContext context) deleteTask,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, BuildContext context)? load,
    TResult? Function(String text)? text,
    TResult? Function(Importance priority)? priority,
    TResult? Function(DateTime deadline)? deadline,
    TResult? Function()? deleteDeadline,
    TResult? Function(BuildContext context)? save,
    TResult? Function(BuildContext context)? deleteTask,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, BuildContext context)? load,
    TResult Function(String text)? text,
    TResult Function(Importance priority)? priority,
    TResult Function(DateTime deadline)? deadline,
    TResult Function()? deleteDeadline,
    TResult Function(BuildContext context)? save,
    TResult Function(BuildContext context)? deleteTask,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
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
    required TResult Function(EditorSaver value) save,
    required TResult Function(EditorRemover value) deleteTask,
    required TResult Function(EditorReset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorLoad value)? load,
    TResult? Function(EditorUpdateText value)? text,
    TResult? Function(EditorUpdatePriority value)? priority,
    TResult? Function(EditorUpdateDeadline value)? deadline,
    TResult? Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult? Function(EditorSaver value)? save,
    TResult? Function(EditorRemover value)? deleteTask,
    TResult? Function(EditorReset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoad value)? load,
    TResult Function(EditorUpdateText value)? text,
    TResult Function(EditorUpdatePriority value)? priority,
    TResult Function(EditorUpdateDeadline value)? deadline,
    TResult Function(EditorDeleteDeadline value)? deleteDeadline,
    TResult Function(EditorSaver value)? save,
    TResult Function(EditorRemover value)? deleteTask,
    TResult Function(EditorReset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class EditorReset implements EditorEvent {
  const factory EditorReset() = _$EditorReset;
}

/// @nodoc
mixin _$EditorState {
  Task get task => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, TextEditingController controller)
        initial,
    required TResult Function(Task task, TextEditingController controller)
        loaded,
    required TResult Function(Task task) saveNew,
    required TResult Function(Task task) saveOld,
    required TResult Function(Task task) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, TextEditingController controller)? initial,
    TResult? Function(Task task, TextEditingController controller)? loaded,
    TResult? Function(Task task)? saveNew,
    TResult? Function(Task task)? saveOld,
    TResult? Function(Task task)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, TextEditingController controller)? initial,
    TResult Function(Task task, TextEditingController controller)? loaded,
    TResult Function(Task task)? saveNew,
    TResult Function(Task task)? saveOld,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateSaveNew value) saveNew,
    required TResult Function(EditorStateSaveOld value) saveOld,
    required TResult Function(EditorStateRemover value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateSaveNew value)? saveNew,
    TResult? Function(EditorStateSaveOld value)? saveOld,
    TResult? Function(EditorStateRemover value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateSaveNew value)? saveNew,
    TResult Function(EditorStateSaveOld value)? saveOld,
    TResult Function(EditorStateRemover value)? delete,
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
  $Res call({Task task});

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
  }) {
    return _then(_value.copyWith(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
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
  $Res call({Task task, TextEditingController controller});

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
    Object? controller = null,
  }) {
    return _then(_$EditorStateInitial(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$EditorStateInitial implements EditorStateInitial {
  const _$EditorStateInitial({required this.task, required this.controller});

  @override
  final Task task;
  @override
  final TextEditingController controller;

  @override
  String toString() {
    return 'EditorState.initial(task: $task, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateInitial &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateInitialCopyWith<_$EditorStateInitial> get copyWith =>
      __$$EditorStateInitialCopyWithImpl<_$EditorStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, TextEditingController controller)
        initial,
    required TResult Function(Task task, TextEditingController controller)
        loaded,
    required TResult Function(Task task) saveNew,
    required TResult Function(Task task) saveOld,
    required TResult Function(Task task) delete,
  }) {
    return initial(task, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, TextEditingController controller)? initial,
    TResult? Function(Task task, TextEditingController controller)? loaded,
    TResult? Function(Task task)? saveNew,
    TResult? Function(Task task)? saveOld,
    TResult? Function(Task task)? delete,
  }) {
    return initial?.call(task, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, TextEditingController controller)? initial,
    TResult Function(Task task, TextEditingController controller)? loaded,
    TResult Function(Task task)? saveNew,
    TResult Function(Task task)? saveOld,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(task, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateSaveNew value) saveNew,
    required TResult Function(EditorStateSaveOld value) saveOld,
    required TResult Function(EditorStateRemover value) delete,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateSaveNew value)? saveNew,
    TResult? Function(EditorStateSaveOld value)? saveOld,
    TResult? Function(EditorStateRemover value)? delete,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateSaveNew value)? saveNew,
    TResult Function(EditorStateSaveOld value)? saveOld,
    TResult Function(EditorStateRemover value)? delete,
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
      required final TextEditingController controller}) = _$EditorStateInitial;

  @override
  Task get task;
  TextEditingController get controller;
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
  $Res call({Task task, TextEditingController controller});

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
    Object? task = null,
    Object? controller = null,
  }) {
    return _then(_$EditorStateLoaded(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$EditorStateLoaded implements EditorStateLoaded {
  const _$EditorStateLoaded({required this.task, required this.controller});

  @override
  final Task task;
  @override
  final TextEditingController controller;

  @override
  String toString() {
    return 'EditorState.loaded(task: $task, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateLoaded &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      __$$EditorStateLoadedCopyWithImpl<_$EditorStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, TextEditingController controller)
        initial,
    required TResult Function(Task task, TextEditingController controller)
        loaded,
    required TResult Function(Task task) saveNew,
    required TResult Function(Task task) saveOld,
    required TResult Function(Task task) delete,
  }) {
    return loaded(task, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, TextEditingController controller)? initial,
    TResult? Function(Task task, TextEditingController controller)? loaded,
    TResult? Function(Task task)? saveNew,
    TResult? Function(Task task)? saveOld,
    TResult? Function(Task task)? delete,
  }) {
    return loaded?.call(task, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, TextEditingController controller)? initial,
    TResult Function(Task task, TextEditingController controller)? loaded,
    TResult Function(Task task)? saveNew,
    TResult Function(Task task)? saveOld,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(task, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateSaveNew value) saveNew,
    required TResult Function(EditorStateSaveOld value) saveOld,
    required TResult Function(EditorStateRemover value) delete,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateSaveNew value)? saveNew,
    TResult? Function(EditorStateSaveOld value)? saveOld,
    TResult? Function(EditorStateRemover value)? delete,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateSaveNew value)? saveNew,
    TResult Function(EditorStateSaveOld value)? saveOld,
    TResult Function(EditorStateRemover value)? delete,
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
      {required final Task task,
      required final TextEditingController controller}) = _$EditorStateLoaded;

  @override
  Task get task;
  TextEditingController get controller;
  @override
  @JsonKey(ignore: true)
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorStateSaveNewCopyWith<$Res>
    implements $EditorStateCopyWith<$Res> {
  factory _$$EditorStateSaveNewCopyWith(_$EditorStateSaveNew value,
          $Res Function(_$EditorStateSaveNew) then) =
      __$$EditorStateSaveNewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$EditorStateSaveNewCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateSaveNew>
    implements _$$EditorStateSaveNewCopyWith<$Res> {
  __$$EditorStateSaveNewCopyWithImpl(
      _$EditorStateSaveNew _value, $Res Function(_$EditorStateSaveNew) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$EditorStateSaveNew(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$EditorStateSaveNew implements EditorStateSaveNew {
  const _$EditorStateSaveNew({required this.task});

  @override
  final Task task;

  @override
  String toString() {
    return 'EditorState.saveNew(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateSaveNew &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateSaveNewCopyWith<_$EditorStateSaveNew> get copyWith =>
      __$$EditorStateSaveNewCopyWithImpl<_$EditorStateSaveNew>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, TextEditingController controller)
        initial,
    required TResult Function(Task task, TextEditingController controller)
        loaded,
    required TResult Function(Task task) saveNew,
    required TResult Function(Task task) saveOld,
    required TResult Function(Task task) delete,
  }) {
    return saveNew(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, TextEditingController controller)? initial,
    TResult? Function(Task task, TextEditingController controller)? loaded,
    TResult? Function(Task task)? saveNew,
    TResult? Function(Task task)? saveOld,
    TResult? Function(Task task)? delete,
  }) {
    return saveNew?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, TextEditingController controller)? initial,
    TResult Function(Task task, TextEditingController controller)? loaded,
    TResult Function(Task task)? saveNew,
    TResult Function(Task task)? saveOld,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (saveNew != null) {
      return saveNew(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateSaveNew value) saveNew,
    required TResult Function(EditorStateSaveOld value) saveOld,
    required TResult Function(EditorStateRemover value) delete,
  }) {
    return saveNew(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateSaveNew value)? saveNew,
    TResult? Function(EditorStateSaveOld value)? saveOld,
    TResult? Function(EditorStateRemover value)? delete,
  }) {
    return saveNew?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateSaveNew value)? saveNew,
    TResult Function(EditorStateSaveOld value)? saveOld,
    TResult Function(EditorStateRemover value)? delete,
    required TResult orElse(),
  }) {
    if (saveNew != null) {
      return saveNew(this);
    }
    return orElse();
  }
}

abstract class EditorStateSaveNew implements EditorState {
  const factory EditorStateSaveNew({required final Task task}) =
      _$EditorStateSaveNew;

  @override
  Task get task;
  @override
  @JsonKey(ignore: true)
  _$$EditorStateSaveNewCopyWith<_$EditorStateSaveNew> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorStateSaveOldCopyWith<$Res>
    implements $EditorStateCopyWith<$Res> {
  factory _$$EditorStateSaveOldCopyWith(_$EditorStateSaveOld value,
          $Res Function(_$EditorStateSaveOld) then) =
      __$$EditorStateSaveOldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$EditorStateSaveOldCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateSaveOld>
    implements _$$EditorStateSaveOldCopyWith<$Res> {
  __$$EditorStateSaveOldCopyWithImpl(
      _$EditorStateSaveOld _value, $Res Function(_$EditorStateSaveOld) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$EditorStateSaveOld(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$EditorStateSaveOld implements EditorStateSaveOld {
  const _$EditorStateSaveOld({required this.task});

  @override
  final Task task;

  @override
  String toString() {
    return 'EditorState.saveOld(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateSaveOld &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateSaveOldCopyWith<_$EditorStateSaveOld> get copyWith =>
      __$$EditorStateSaveOldCopyWithImpl<_$EditorStateSaveOld>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, TextEditingController controller)
        initial,
    required TResult Function(Task task, TextEditingController controller)
        loaded,
    required TResult Function(Task task) saveNew,
    required TResult Function(Task task) saveOld,
    required TResult Function(Task task) delete,
  }) {
    return saveOld(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, TextEditingController controller)? initial,
    TResult? Function(Task task, TextEditingController controller)? loaded,
    TResult? Function(Task task)? saveNew,
    TResult? Function(Task task)? saveOld,
    TResult? Function(Task task)? delete,
  }) {
    return saveOld?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, TextEditingController controller)? initial,
    TResult Function(Task task, TextEditingController controller)? loaded,
    TResult Function(Task task)? saveNew,
    TResult Function(Task task)? saveOld,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (saveOld != null) {
      return saveOld(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateSaveNew value) saveNew,
    required TResult Function(EditorStateSaveOld value) saveOld,
    required TResult Function(EditorStateRemover value) delete,
  }) {
    return saveOld(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateSaveNew value)? saveNew,
    TResult? Function(EditorStateSaveOld value)? saveOld,
    TResult? Function(EditorStateRemover value)? delete,
  }) {
    return saveOld?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateSaveNew value)? saveNew,
    TResult Function(EditorStateSaveOld value)? saveOld,
    TResult Function(EditorStateRemover value)? delete,
    required TResult orElse(),
  }) {
    if (saveOld != null) {
      return saveOld(this);
    }
    return orElse();
  }
}

abstract class EditorStateSaveOld implements EditorState {
  const factory EditorStateSaveOld({required final Task task}) =
      _$EditorStateSaveOld;

  @override
  Task get task;
  @override
  @JsonKey(ignore: true)
  _$$EditorStateSaveOldCopyWith<_$EditorStateSaveOld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorStateRemoverCopyWith<$Res>
    implements $EditorStateCopyWith<$Res> {
  factory _$$EditorStateRemoverCopyWith(_$EditorStateRemover value,
          $Res Function(_$EditorStateRemover) then) =
      __$$EditorStateRemoverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$EditorStateRemoverCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateRemover>
    implements _$$EditorStateRemoverCopyWith<$Res> {
  __$$EditorStateRemoverCopyWithImpl(
      _$EditorStateRemover _value, $Res Function(_$EditorStateRemover) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$EditorStateRemover(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$EditorStateRemover implements EditorStateRemover {
  const _$EditorStateRemover({required this.task});

  @override
  final Task task;

  @override
  String toString() {
    return 'EditorState.delete(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateRemover &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateRemoverCopyWith<_$EditorStateRemover> get copyWith =>
      __$$EditorStateRemoverCopyWithImpl<_$EditorStateRemover>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task, TextEditingController controller)
        initial,
    required TResult Function(Task task, TextEditingController controller)
        loaded,
    required TResult Function(Task task) saveNew,
    required TResult Function(Task task) saveOld,
    required TResult Function(Task task) delete,
  }) {
    return delete(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task, TextEditingController controller)? initial,
    TResult? Function(Task task, TextEditingController controller)? loaded,
    TResult? Function(Task task)? saveNew,
    TResult? Function(Task task)? saveOld,
    TResult? Function(Task task)? delete,
  }) {
    return delete?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task, TextEditingController controller)? initial,
    TResult Function(Task task, TextEditingController controller)? loaded,
    TResult Function(Task task)? saveNew,
    TResult Function(Task task)? saveOld,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateInitial value) initial,
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateSaveNew value) saveNew,
    required TResult Function(EditorStateSaveOld value) saveOld,
    required TResult Function(EditorStateRemover value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateInitial value)? initial,
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateSaveNew value)? saveNew,
    TResult? Function(EditorStateSaveOld value)? saveOld,
    TResult? Function(EditorStateRemover value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateInitial value)? initial,
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateSaveNew value)? saveNew,
    TResult Function(EditorStateSaveOld value)? saveOld,
    TResult Function(EditorStateRemover value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class EditorStateRemover implements EditorState {
  const factory EditorStateRemover({required final Task task}) =
      _$EditorStateRemover;

  @override
  Task get task;
  @override
  @JsonKey(ignore: true)
  _$$EditorStateRemoverCopyWith<_$EditorStateRemover> get copyWith =>
      throw _privateConstructorUsedError;
}
