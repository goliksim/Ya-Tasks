import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:ya_todolist/common/logger.dart';

abstract class Analytics {
  static FirebaseAnalytics get analyticsInstance => FirebaseAnalytics.instance;

  static void logEvent(String eventName, dynamic args) async {
    try {
      final analytics = analyticsInstance;
      switch (eventName) {
        case ('page_changed'):
          {
            await analytics.logEvent(
                name: 'page_changed', parameters: {'current_page': args});
          }
          break;
        case ('task_done'):
          {
            await analytics.logEvent(name: 'task_done', parameters: {
              'before_deadline': (args.deadline != null)
                  ? DateTime.now().isBefore(args.deadline!)
                  : 'none'
            });
          }
          break;

        case ('task_added'):
          {
            await analytics.logEvent(name: 'task_added', parameters: {
              'text_len': args.text.length.toString(),
              //'imp_type': args.importance.name,
              'deadline': (args.deadline != null).toString(),
              'deadline_offset': (args.deadline != null)
                  ? args.deadline!.difference(args.createdAt!).inDays.toString()
                  : 'none'
            });
          }
          break;
        case ('task_deleted'):
          {
            await analytics.logEvent(
                name: 'task_deleted',
                parameters: {'was_done': args.done.toString()});
          }
          break;
      }
      Logs.logg('Analytics: $eventName is logged to Firebase');
    } catch (e) {
      Logs.warning('Analytics: Firebase not initialized, $e');
    }
  }
}
