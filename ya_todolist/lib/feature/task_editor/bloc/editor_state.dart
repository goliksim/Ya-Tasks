
part of 'editor_bloc.dart';


@freezed
class EditorState with _$EditorState {
  const factory EditorState.initial({required Task task, required bool editMode}) = EditorStateInitial;
      const factory EditorState.loaded({required bool editMode,
      required Task task}) = EditorStateLoaded;
  
}
