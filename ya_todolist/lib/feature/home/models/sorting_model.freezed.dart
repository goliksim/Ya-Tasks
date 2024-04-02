// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sorting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortingType {
  SortType get type => throw _privateConstructorUsedError;
  bool get isAscending => throw _privateConstructorUsedError;
  bool get hideDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortingTypeCopyWith<SortingType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortingTypeCopyWith<$Res> {
  factory $SortingTypeCopyWith(
          SortingType value, $Res Function(SortingType) then) =
      _$SortingTypeCopyWithImpl<$Res, SortingType>;
  @useResult
  $Res call({SortType type, bool isAscending, bool hideDone});
}

/// @nodoc
class _$SortingTypeCopyWithImpl<$Res, $Val extends SortingType>
    implements $SortingTypeCopyWith<$Res> {
  _$SortingTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? isAscending = null,
    Object? hideDone = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SortType,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      hideDone: null == hideDone
          ? _value.hideDone
          : hideDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortingTypeCopyWith<$Res>
    implements $SortingTypeCopyWith<$Res> {
  factory _$$_SortingTypeCopyWith(
          _$_SortingType value, $Res Function(_$_SortingType) then) =
      __$$_SortingTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortType type, bool isAscending, bool hideDone});
}

/// @nodoc
class __$$_SortingTypeCopyWithImpl<$Res>
    extends _$SortingTypeCopyWithImpl<$Res, _$_SortingType>
    implements _$$_SortingTypeCopyWith<$Res> {
  __$$_SortingTypeCopyWithImpl(
      _$_SortingType _value, $Res Function(_$_SortingType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? isAscending = null,
    Object? hideDone = null,
  }) {
    return _then(_$_SortingType(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SortType,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      hideDone: null == hideDone
          ? _value.hideDone
          : hideDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SortingType implements _SortingType {
  const _$_SortingType(
      {required this.type, this.isAscending = true, this.hideDone = false});

  @override
  final SortType type;
  @override
  @JsonKey()
  final bool isAscending;
  @override
  @JsonKey()
  final bool hideDone;

  @override
  String toString() {
    return 'SortingType(type: $type, isAscending: $isAscending, hideDone: $hideDone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortingType &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending) &&
            (identical(other.hideDone, hideDone) ||
                other.hideDone == hideDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, isAscending, hideDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortingTypeCopyWith<_$_SortingType> get copyWith =>
      __$$_SortingTypeCopyWithImpl<_$_SortingType>(this, _$identity);
}

abstract class _SortingType implements SortingType {
  const factory _SortingType(
      {required final SortType type,
      final bool isAscending,
      final bool hideDone}) = _$_SortingType;

  @override
  SortType get type;
  @override
  bool get isAscending;
  @override
  bool get hideDone;
  @override
  @JsonKey(ignore: true)
  _$$_SortingTypeCopyWith<_$_SortingType> get copyWith =>
      throw _privateConstructorUsedError;
}
