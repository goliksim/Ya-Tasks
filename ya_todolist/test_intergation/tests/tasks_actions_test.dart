import 'package:ya_todolist/app/di.dart';
import 'package:ya_todolist/feature/task/data/domain/task_model.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import '../test_constants.dart';
import '../test_app.dart';
import 'dart:io';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  late RepositoryMock repositoryMock;
  setUp(() {
    registerFallbackValue(TaskListTestConstants.taskList.first);
    repositoryMock = RepositoryMock();
  });
  group('Group 1', () {
    testWidgets('Test of init loading', (WidgetTester tester) async {
      var testApp = TestApp.build(repositoryMock);
      // Действия на основном экране
      TaskListTestConstants.arrangeRepositoryMock(repositoryMock,
          taskList: TaskListTestConstants.taskList);

      await tester.pumpWidget(testApp);

      //проверим, что значок загрузки не висит бесконечно
      sleep(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Test of adding new task', (WidgetTester tester) async {
      var testApp = TestApp.build(repositoryMock);
      // Действия на основном экране
      TaskListTestConstants.arrangeRepositoryMock(repositoryMock,
          taskList: TaskListTestConstants.taskList);

      await tester.pumpWidget(testApp);

      await tester
          .pumpAndSettle(); //дожидаемся пока ui примет стабильное положение

      //Проверка добавления задачки быстрым способом
      var fastTaskText = 'Some text of Fast Task';

      await tester.enterText(find.byType(TextField), fastTaskText);
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pumpAndSettle();
      expect(find.textContaining(fastTaskText), findsAtLeastNWidgets(1));
      sleep(const Duration(seconds: 2));

      //жмем на плавующую кнопку
      await tester.tap(find.byType(FloatingActionButton));
      // Действия на экране добавления задачи
      await tester.pumpAndSettle();
      sleep(const Duration(seconds: 1));

      expect(find.byType(TextField), findsOneWidget);

      //вводим текст
      var newText = 'Some text of new Task 3 from EditorPage';
      await tester.enterText(find.byType(TextField), newText);
      sleep(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      //выбираем приоритет
      await tester.tap(find.byType(PopupMenuButton<Importance>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('!! High'));
      await tester.pumpAndSettle();
      sleep(const Duration(seconds: 1));

      //выбираем дедлайн
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      await tester.tap(find.text('30'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      sleep(const Duration(seconds: 1));

      //сохраняем
      await tester.tap(find.text('SAVE'));

      // Проверяем
      await tester.pumpAndSettle();
      sleep(const Duration(seconds: 1));

      expect(find.textContaining(newText, findRichText: true),
          findsAtLeastNWidgets(1)); //ожидание, что только один виджет
      sleep(const Duration(seconds: 3));
    });

    testWidgets('Test of dissmissible', (WidgetTester tester) async {
      // Действия на основном экране
      var testApp = TestApp.build(repositoryMock);
      TaskListTestConstants.arrangeRepositoryMock(repositoryMock,
          taskList: TaskListTestConstants.taskList);
      await tester.pumpWidget(testApp);

      await tester.pumpAndSettle();

      // Выполняем задачи
      for (int i = 0; i < 2; i++) {
        await tester.drag(find.byType(Dismissible).first, const Offset(500, 0));
        await tester.pumpAndSettle();
        sleep(const Duration(seconds: 1));
      }

      expect(find.byType(Dismissible), findsNothing);

      // Показываем выполненные
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();
      expect(find.byType(Dismissible), findsAtLeastNWidgets(2));

      // Удаляем задачи
      for (int i = 0; i < 2; i++) {
        await tester.drag(
            find.byType(Dismissible).first, const Offset(-500, 0));
        await tester.pumpAndSettle();
        sleep(const Duration(seconds: 1));
      }
      await tester.pumpAndSettle();
      expect(find.byType(Dismissible), findsNothing);
      sleep(const Duration(seconds: 3));
    });

    testWidgets('Test of checkbox', (WidgetTester tester) async {
      // Действия на основном экране
      var testApp = TestApp.build(repositoryMock);
      TaskListTestConstants.arrangeRepositoryMock(repositoryMock,
          taskList: TaskListTestConstants.taskList);
      await tester.pumpWidget(testApp);

      await tester.pumpAndSettle();

      // Выполняем задачи
      for (int i = 0; i < 2; i++) {
        await tester.tap(find.byType(Checkbox).first);
        await tester.pumpAndSettle();
        sleep(const Duration(seconds: 1));
      }
      await tester.pumpAndSettle();
      expect(find.byType(Dismissible), findsNothing);

      // Показываем выполненные
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();
      expect(find.byType(Dismissible), findsAtLeastNWidgets(2));
      sleep(const Duration(seconds: 3));
    });
  });
}
