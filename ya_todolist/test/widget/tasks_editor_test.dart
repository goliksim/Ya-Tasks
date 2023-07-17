import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';

import '../../test_intergation/test_app.dart';
import '../../test_intergation/test_constants.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late RepositoryMock repositoryMock;
  setUp(() {
    registerFallbackValue(TaskListTestConstants.taskList[0]);
    repositoryMock = RepositoryMock();
  });

  testWidgets('Task Editor', (WidgetTester tester) async {
    var testApp = TestApp.build(repositoryMock);
    // Действия на основном экране
    TaskListTestConstants.arrangeRepositoryMock(repositoryMock,
        taskList: TaskListTestConstants.taskList);

    await tester.pumpWidget(testApp);
    await tester.pumpAndSettle();

    //жмем на плавующую кнопку
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 1));
    // Действия на экране добавления задачи

    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.text('SAVE'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(PopupMenuButton<Importance>), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);
  });
}
