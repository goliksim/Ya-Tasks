class NavigationState {
  final bool? _empty;
  final String? selectedTask;

  bool get isTaskEditor => selectedTask != null;

  bool get isRoot => !isTaskEditor && !isUnknown;

  bool get isUnknown => _empty == true;

  NavigationState.root()
      : _empty = false,
        selectedTask = null;

  NavigationState.item(this.selectedTask) : _empty = false;

  NavigationState.empty()
      : _empty = true,
        selectedTask = null;
}
