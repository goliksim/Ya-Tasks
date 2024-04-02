import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorting_model.freezed.dart';

@freezed
class SortingType with _$SortingType {
  const factory SortingType({
    required SortType type,
    @Default(true) bool isAscending,
    @Default(false) bool hideDone,
  }) = _SortingType;
}

enum SortType { deadline, changedAt, createdAt, importance, text, done }
