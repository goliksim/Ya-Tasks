import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_intergation/test_app.dart';
import '../../test_intergation/test_constants.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late RepositoryMock repositoryMock;
  setUp(() {
    registerFallbackValue(TaskListTestConstants.taskList.first);
    repositoryMock = RepositoryMock();
  });

  testWidgets('Task List', (WidgetTester tester) async {
    var testApp = TestApp.build(repositoryMock);
    // Действия на основном экране
    TaskListTestConstants.arrangeRepositoryMock(repositoryMock,
        taskList: TaskListTestConstants.taskList);
    await tester.pumpWidget(testApp);

    expect(find.text('My tasks'), findsAtLeastNWidgets(1));
    //находим индикатор
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    //иконки отбражения
    final findVisibility = find.byIcon(Icons.visibility);
    final findVisibilityOff = find.byIcon(Icons.visibility_off);
    final int count =
        findVisibility.evaluate().length + findVisibilityOff.evaluate().length;

    expect(count, greaterThan(0));
    expect(find.text('New'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
