// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksEventCopyWith<$Res> {
  factory $TasksEventCopyWith(
          TasksEvent value, $Res Function(TasksEvent) then) =
      _$TasksEventCopyWithImpl<$Res, TasksEvent>;
}

/// @nodoc
class _$TasksEventCopyWithImpl<$Res, $Val extends TasksEvent>
    implements $TasksEventCopyWith<$Res> {
  _$TasksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadTasksCopyWith<$Res> {
  factory _$$LoadTasksCopyWith(
          _$LoadTasks value, $Res Function(_$LoadTasks) then) =
      __$$LoadTasksCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTasksCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$LoadTasks>
    implements _$$LoadTasksCopyWith<$Res> {
  __$$LoadTasksCopyWithImpl(
      _$LoadTasks _value, $Res Function(_$LoadTasks) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadTasks with DiagnosticableTreeMixin implements LoadTasks {
  const _$LoadTasks();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksEvent.load()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TasksEvent.load'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTasks);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadTasks implements TasksEvent {
  const factory LoadTasks() = _$LoadTasks;
}

/// @nodoc
abstract class _$$LoadTasksListCopyWith<$Res> {
  factory _$$LoadTasksListCopyWith(
          _$LoadTasksList value, $Res Function(_$LoadTasksList) then) =
      __$$LoadTasksListCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$LoadTasksListCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$LoadTasksList>
    implements _$$LoadTasksListCopyWith<$Res> {
  __$$LoadTasksListCopyWithImpl(
      _$LoadTasksList _value, $Res Function(_$LoadTasksList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$LoadTasksList(
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$LoadTasksList with DiagnosticableTreeMixin implements LoadTasksList {
  const _$LoadTasksList(final List<Task> tasks) : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksEvent.loadFromList(tasks: $tasks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksEvent.loadFromList'))
      ..add(DiagnosticsProperty('tasks', tasks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTasksList &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTasksListCopyWith<_$LoadTasksList> get copyWith =>
      __$$LoadTasksListCopyWithImpl<_$LoadTasksList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) {
    return loadFromList(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) {
    return loadFromList?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (loadFromList != null) {
      return loadFromList(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) {
    return loadFromList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) {
    return loadFromList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) {
    if (loadFromList != null) {
      return loadFromList(this);
    }
    return orElse();
  }
}

abstract class LoadTasksList implements TasksEvent {
  const factory LoadTasksList(final List<Task> tasks) = _$LoadTasksList;

  List<Task> get tasks;
  @JsonKey(ignore: true)
  _$$LoadTasksListCopyWith<_$LoadTasksList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeFilterCopyWith<$Res> {
  factory _$$ChangeFilterCopyWith(
          _$ChangeFilter value, $Res Function(_$ChangeFilter) then) =
      __$$ChangeFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({SortingType? sortingType});

  $SortingTypeCopyWith<$Res>? get sortingType;
}

/// @nodoc
class __$$ChangeFilterCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$ChangeFilter>
    implements _$$ChangeFilterCopyWith<$Res> {
  __$$ChangeFilterCopyWithImpl(
      _$ChangeFilter _value, $Res Function(_$ChangeFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortingType = freezed,
  }) {
    return _then(_$ChangeFilter(
      sortingType: freezed == sortingType
          ? _value.sortingType
          : sortingType // ignore: cast_nullable_to_non_nullable
              as SortingType?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SortingTypeCopyWith<$Res>? get sortingType {
    if (_value.sortingType == null) {
      return null;
    }

    return $SortingTypeCopyWith<$Res>(_value.sortingType!, (value) {
      return _then(_value.copyWith(sortingType: value));
    });
  }
}

/// @nodoc

class _$ChangeFilter with DiagnosticableTreeMixin implements ChangeFilter {
  const _$ChangeFilter({this.sortingType});

  @override
  final SortingType? sortingType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksEvent.filter(sortingType: $sortingType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksEvent.filter'))
      ..add(DiagnosticsProperty('sortingType', sortingType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFilter &&
            (identical(other.sortingType, sortingType) ||
                other.sortingType == sortingType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortingType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFilterCopyWith<_$ChangeFilter> get copyWith =>
      __$$ChangeFilterCopyWithImpl<_$ChangeFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) {
    return filter(sortingType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) {
    return filter?.call(sortingType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(sortingType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) {
    return filter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) {
    return filter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class ChangeFilter implements TasksEvent {
  const factory ChangeFilter({final SortingType? sortingType}) = _$ChangeFilter;

  SortingType? get sortingType;
  @JsonKey(ignore: true)
  _$$ChangeFilterCopyWith<_$ChangeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTaskCopyWith<$Res> {
  factory _$$AddTaskCopyWith(_$AddTask value, $Res Function(_$AddTask) then) =
      __$$AddTaskCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$AddTaskCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$AddTask>
    implements _$$AddTaskCopyWith<$Res> {
  __$$AddTaskCopyWithImpl(_$AddTask _value, $Res Function(_$AddTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$AddTask(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$AddTask with DiagnosticableTreeMixin implements AddTask {
  const _$AddTask({required this.task});

  @override
  final Task task;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksEvent.add(task: $task)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksEvent.add'))
      ..add(DiagnosticsProperty('task', task));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTask &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskCopyWith<_$AddTask> get copyWith =>
      __$$AddTaskCopyWithImpl<_$AddTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) {
    return add(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) {
    return add?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class AddTask implements TasksEvent {
  const factory AddTask({required final Task task}) = _$AddTask;

  Task get task;
  @JsonKey(ignore: true)
  _$$AddTaskCopyWith<_$AddTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTaskCopyWith<$Res> {
  factory _$$UpdateTaskCopyWith(
          _$UpdateTask value, $Res Function(_$UpdateTask) then) =
      __$$UpdateTaskCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$UpdateTaskCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$UpdateTask>
    implements _$$UpdateTaskCopyWith<$Res> {
  __$$UpdateTaskCopyWithImpl(
      _$UpdateTask _value, $Res Function(_$UpdateTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$UpdateTask(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$UpdateTask with DiagnosticableTreeMixin implements UpdateTask {
  const _$UpdateTask({required this.task});

  @override
  final Task task;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksEvent.update(task: $task)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksEvent.update'))
      ..add(DiagnosticsProperty('task', task));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTask &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaskCopyWith<_$UpdateTask> get copyWith =>
      __$$UpdateTaskCopyWithImpl<_$UpdateTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) {
    return update(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) {
    return update?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateTask implements TasksEvent {
  const factory UpdateTask({required final Task task}) = _$UpdateTask;

  Task get task;
  @JsonKey(ignore: true)
  _$$UpdateTaskCopyWith<_$UpdateTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTaskCopyWith<$Res> {
  factory _$$DeleteTaskCopyWith(
          _$DeleteTask value, $Res Function(_$DeleteTask) then) =
      __$$DeleteTaskCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$DeleteTaskCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$DeleteTask>
    implements _$$DeleteTaskCopyWith<$Res> {
  __$$DeleteTaskCopyWithImpl(
      _$DeleteTask _value, $Res Function(_$DeleteTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$DeleteTask(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$DeleteTask with DiagnosticableTreeMixin implements DeleteTask {
  const _$DeleteTask({required this.task});

  @override
  final Task task;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksEvent.delete(task: $task)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksEvent.delete'))
      ..add(DiagnosticsProperty('task', task));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTask &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTaskCopyWith<_$DeleteTask> get copyWith =>
      __$$DeleteTaskCopyWithImpl<_$DeleteTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Task> tasks) loadFromList,
    required TResult Function(SortingType? sortingType) filter,
    required TResult Function(Task task) add,
    required TResult Function(Task task) update,
    required TResult Function(Task task) delete,
  }) {
    return delete(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Task> tasks)? loadFromList,
    TResult? Function(SortingType? sortingType)? filter,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? update,
    TResult? Function(Task task)? delete,
  }) {
    return delete?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Task> tasks)? loadFromList,
    TResult Function(SortingType? sortingType)? filter,
    TResult Function(Task task)? add,
    TResult Function(Task task)? update,
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
    required TResult Function(LoadTasks value) load,
    required TResult Function(LoadTasksList value) loadFromList,
    required TResult Function(ChangeFilter value) filter,
    required TResult Function(AddTask value) add,
    required TResult Function(UpdateTask value) update,
    required TResult Function(DeleteTask value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTasks value)? load,
    TResult? Function(LoadTasksList value)? loadFromList,
    TResult? Function(ChangeFilter value)? filter,
    TResult? Function(AddTask value)? add,
    TResult? Function(UpdateTask value)? update,
    TResult? Function(DeleteTask value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTasks value)? load,
    TResult Function(LoadTasksList value)? loadFromList,
    TResult Function(ChangeFilter value)? filter,
    TResult Function(AddTask value)? add,
    TResult Function(UpdateTask value)? update,
    TResult Function(DeleteTask value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteTask implements TasksEvent {
  const factory DeleteTask({required final Task task}) = _$DeleteTask;

  Task get task;
  @JsonKey(ignore: true)
  _$$DeleteTaskCopyWith<_$DeleteTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TasksState {
  Repository get rep => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Repository rep) initial,
    required TResult Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Repository rep)? initial,
    TResult? Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Repository rep)? initial,
    TResult Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(TasksStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(TasksStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(TasksStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksStateCopyWith<TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
  @useResult
  $Res call({Repository rep});
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rep = null,
  }) {
    return _then(_value.copyWith(
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as Repository,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksStateInitialCopyWith<$Res>
    implements $TasksStateCopyWith<$Res> {
  factory _$$TasksStateInitialCopyWith(
          _$TasksStateInitial value, $Res Function(_$TasksStateInitial) then) =
      __$$TasksStateInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Repository rep});
}

/// @nodoc
class __$$TasksStateInitialCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateInitial>
    implements _$$TasksStateInitialCopyWith<$Res> {
  __$$TasksStateInitialCopyWithImpl(
      _$TasksStateInitial _value, $Res Function(_$TasksStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rep = null,
  }) {
    return _then(_$TasksStateInitial(
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as Repository,
    ));
  }
}

/// @nodoc

class _$TasksStateInitial
    with DiagnosticableTreeMixin
    implements TasksStateInitial {
  const _$TasksStateInitial({required this.rep});

  @override
  final Repository rep;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksState.initial(rep: $rep)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksState.initial'))
      ..add(DiagnosticsProperty('rep', rep));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateInitial &&
            (identical(other.rep, rep) || other.rep == rep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateInitialCopyWith<_$TasksStateInitial> get copyWith =>
      __$$TasksStateInitialCopyWithImpl<_$TasksStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Repository rep) initial,
    required TResult Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)
        loaded,
  }) {
    return initial(rep);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Repository rep)? initial,
    TResult? Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)?
        loaded,
  }) {
    return initial?.call(rep);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Repository rep)? initial,
    TResult Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(rep);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(TasksStateLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(TasksStateLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(TasksStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TasksStateInitial implements TasksState {
  const factory TasksStateInitial({required final Repository rep}) =
      _$TasksStateInitial;

  @override
  Repository get rep;
  @override
  @JsonKey(ignore: true)
  _$$TasksStateInitialCopyWith<_$TasksStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksStateLoadedCopyWith<$Res>
    implements $TasksStateCopyWith<$Res> {
  factory _$$TasksStateLoadedCopyWith(
          _$TasksStateLoaded value, $Res Function(_$TasksStateLoaded) then) =
      __$$TasksStateLoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> myTasks,
      Repository rep,
      SortingType sortingType,
      bool loaded});

  $SortingTypeCopyWith<$Res> get sortingType;
}

/// @nodoc
class __$$TasksStateLoadedCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateLoaded>
    implements _$$TasksStateLoadedCopyWith<$Res> {
  __$$TasksStateLoadedCopyWithImpl(
      _$TasksStateLoaded _value, $Res Function(_$TasksStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myTasks = null,
    Object? rep = null,
    Object? sortingType = null,
    Object? loaded = null,
  }) {
    return _then(_$TasksStateLoaded(
      myTasks: null == myTasks
          ? _value._myTasks
          : myTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as Repository,
      sortingType: null == sortingType
          ? _value.sortingType
          : sortingType // ignore: cast_nullable_to_non_nullable
              as SortingType,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SortingTypeCopyWith<$Res> get sortingType {
    return $SortingTypeCopyWith<$Res>(_value.sortingType, (value) {
      return _then(_value.copyWith(sortingType: value));
    });
  }
}

/// @nodoc

class _$TasksStateLoaded
    with DiagnosticableTreeMixin
    implements TasksStateLoaded {
  const _$TasksStateLoaded(
      {required final List<Task> myTasks,
      required this.rep,
      required this.sortingType,
      required this.loaded})
      : _myTasks = myTasks;

  final List<Task> _myTasks;
  @override
  List<Task> get myTasks {
    if (_myTasks is EqualUnmodifiableListView) return _myTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myTasks);
  }

  @override
  final Repository rep;
//TODO MOVE REPOSITORY TO DI
  @override
  final SortingType sortingType;
  @override
  final bool loaded;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TasksState.loaded(myTasks: $myTasks, rep: $rep, sortingType: $sortingType, loaded: $loaded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TasksState.loaded'))
      ..add(DiagnosticsProperty('myTasks', myTasks))
      ..add(DiagnosticsProperty('rep', rep))
      ..add(DiagnosticsProperty('sortingType', sortingType))
      ..add(DiagnosticsProperty('loaded', loaded));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateLoaded &&
            const DeepCollectionEquality().equals(other._myTasks, _myTasks) &&
            (identical(other.rep, rep) || other.rep == rep) &&
            (identical(other.sortingType, sortingType) ||
                other.sortingType == sortingType) &&
            (identical(other.loaded, loaded) || other.loaded == loaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_myTasks), rep, sortingType, loaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateLoadedCopyWith<_$TasksStateLoaded> get copyWith =>
      __$$TasksStateLoadedCopyWithImpl<_$TasksStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Repository rep) initial,
    required TResult Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)
        loaded,
  }) {
    return loaded(myTasks, rep, sortingType, this.loaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Repository rep)? initial,
    TResult? Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)?
        loaded,
  }) {
    return loaded?.call(myTasks, rep, sortingType, this.loaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Repository rep)? initial,
    TResult Function(List<Task> myTasks, Repository rep,
            SortingType sortingType, bool loaded)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(myTasks, rep, sortingType, this.loaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(TasksStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(TasksStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(TasksStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TasksStateLoaded implements TasksState {
  const factory TasksStateLoaded(
      {required final List<Task> myTasks,
      required final Repository rep,
      required final SortingType sortingType,
      required final bool loaded}) = _$TasksStateLoaded;

  List<Task> get myTasks;
  @override
  Repository get rep; //TODO MOVE REPOSITORY TO DI
  SortingType get sortingType;
  bool get loaded;
  @override
  @JsonKey(ignore: true)
  _$$TasksStateLoadedCopyWith<_$TasksStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
