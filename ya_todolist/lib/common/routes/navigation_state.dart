import 'package:ya_todolist/app/di.dart';
import 'package:ya_todolist/common/logger.dart';

class NavigationState {
  final bool? _empty;
  final String? selectedTask;

  bool get isTaskEditor => selectedTask != null;

  bool get isRoot => !isTaskEditor && !isUnknown;

  bool get isUnknown => _empty == true;

  NavigationState.root([this._empty = false, this.selectedTask]) {
    try {
      Locator.analytics.logEvent(name: 'page_changed', parameters: {
        'current_page': 'root',
      }).then((_) {
        Logs.logIns.writeLog('Logged rootPage to firebase');
      });
    } catch (e) {
      Logs.logIns.writeLog('Doesnt init Firebase');
    }
  }

  NavigationState.item(this.selectedTask, [this._empty = false]) {
    try {
      Locator.analytics.logEvent(name: 'page_changed', parameters: {
        'current_page': 'edit',
      }).then((_) {
        Logs.logIns.writeLog('Logged itemPage to firebase');
      });
    } catch (e) {
      Logs.logIns.writeLog('Doesnt init Firebase');
    }
  }

  NavigationState.empty([this._empty = true, this.selectedTask]) {
    try {
      Locator.analytics.logEvent(name: 'page_chanhed', parameters: {
        'current_page': 'edit_empty',
      }).then((_) {
        Logs.logIns.writeLog('Logged emptyPage to firebase');
      });
    } catch (e) {
      Logs.logIns.writeLog('Doesnt init Firebase');
    }
  }
}
