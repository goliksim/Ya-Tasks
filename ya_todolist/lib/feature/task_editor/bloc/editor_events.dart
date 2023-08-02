part of 'editor_bloc.dart';



@freezed
abstract class EditorEvent with _$EditorEvent {
  const factory EditorEvent.load({required String? id, required BuildContext context}) = EditorLoad;
  const factory EditorEvent.text({required String text}) = EditorUpdateText;
  const factory EditorEvent.priority({required Importance priority}) = EditorUpdatePriority;
  const factory EditorEvent.deadline({required DateTime deadline}) = EditorUpdateDeadline;
  const factory EditorEvent.deleteDeadline() = EditorDeleteDeadline;
}








