class NavigationState {
  final bool? _empty;
  final String? selectedTask;

  bool get isTaskEditor => selectedTask != null;

  bool get isRoot => !isTaskEditor && !isUnknown;

  bool get isUnknown => _empty == true;

  NavigationState.root([this._empty = false, this.selectedTask]);

  NavigationState.item(this.selectedTask, [this._empty = false]);

  NavigationState.empty([this._empty = true, this.selectedTask]);
}
