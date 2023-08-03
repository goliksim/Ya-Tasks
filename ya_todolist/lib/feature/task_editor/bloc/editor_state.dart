part of 'editor_bloc.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.initial(
      {required Task task,
      required TextEditingController controller}) = EditorStateInitial;
  const factory EditorState.loaded(
      {required Task task,
      required TextEditingController controller}) = EditorStateLoaded;
  const factory EditorState.saveNew({required Task task}) = EditorStateSaveNew;
  const factory EditorState.saveOld({required Task task}) = EditorStateSaveOld;
  const factory EditorState.delete({required Task task}) = EditorStateRemover;
}
