import 'package:flutter/material.dart';

const TextTheme myTextTheme = TextTheme(
    headline1:
        TextStyle(fontSize: 32, height: 1.1875, fontWeight: FontWeight.w500),
    headline2:
        TextStyle(fontSize: 20, height: 1.6, fontWeight: FontWeight.w500),
    button: TextStyle(fontSize: 14, height: 1.714, fontWeight: FontWeight.w500),
    subtitle1:
        TextStyle(fontSize: 16, height: 1.25, fontWeight: FontWeight.w400),
    headline3:
        TextStyle(fontSize: 14, height: 1.429, fontWeight: FontWeight.w400));

ThemeData myLightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme(
        outline: Color(0x33000000), //separation
        tertiary: Color(0x4D000000),
        brightness: Brightness.light,
        primary: Color(0xFF007AFF),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFFF3B30),
        onError: Color(0xFF34C759),
        background: Color(0xFFF7F6F2),
        onBackground: Color(0xFF000000),
        surface: Color(0xFFFFFFFF),
        onSurfaceVariant: Color(0xFFFFFFFF),
        onSurface: Color(0xFF000000)),
    textTheme: myTextTheme.apply(fontFamily: "Roboto"),
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: const Color(0xFF007AFF),
    ));

ThemeData myDarkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme(
        outline: Color(0x33FFFFFF), //separation
        tertiary: Color(0x66FFFFFF),
        brightness: Brightness.light,
        primary: Color(0xFF0A84FF),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFFF453A),
        onError: Color(0xFF32D74B),
        background: Color(0xFF161618),
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFF252528),
        onSurfaceVariant: Color(0xFF3C3C3F),
        onSurface: Color(0xFF000000)),
    textTheme: myTextTheme.apply(fontFamily: "Roboto"),
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: const Color(0xFF007AFF),
    ));


/*
class Light {
  static const support = {
    'separator': Color(0x33000000),
    'overlay': Color(0x0F000000),
  };
  static const label = {
    'primary': Color(0xFF000000),
    'secondary': Color(0x99000000),
    'tertiary': Color(0x4D000000),
    'disable': Color(0x26000000)
  };
  static const color = {
    'red': Color(0xFFFF3B30),
    'green': Color(0xFF34C759),
    'blue': Color(0xFF007AFF),
    'gray': Color(0xFF8E8E93),
    'gray light': Color(0xFFD1D1D6),
    'white': Color(0xFFFFFFFF)
  };
  static const back = {
    'primary': Color(0xFFF7F6F2),
    'secondary': Color(0xFFFFFFFF),
    'elevated': Color(0xFFFFFFFF)
  };
}

class Dark {
  static const support = {
    'separator': Color(0x33FFFFFF),
    'overlay': Color(0x52000000),
  };
  static const label = {
    'primary': Color(0xFFFFFFFF),
    'secondary': Color(0x99FFFFFF),
    'tertiary': Color(0x66FFFFFF),
    'disable': Color(0x26FFFFFF)
  };
  static const color = {
    'red': Color(0xFFFF453A),
    'green': Color(0xFF32D74B),
    'blue': Color(0xFF0A84FF),
    'gray': Color(0xFF8E8E93),
    'gray light': Color(0xFF48484A),
    'white': Color(0xFFFFFFFF)
  };
  static const back = {
    'primary': Color(0xFF161618),
    'secondary': Color(0xFF252528),
    'elevated': Color(0xFF3C3C3F)
  };
}
*/


/* 
//FOR MANUAL SWITCH
class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;
  toggleTheme(bool isDark) {
    isDark ? ThemeMode.dark : ThemeMode.light;
  }
}*/
