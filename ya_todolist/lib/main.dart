import 'package:flutter/material.dart';
import 'package:ya_todolist/feature/presentation/pages/init_page.dart';
import 'common/theme_constants.dart';

void main() {
  runApp(const MyApp());
}

//ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      //themeMode: _themeManager.themeMode,
      home: const InitPage(),
    );
  }
}
