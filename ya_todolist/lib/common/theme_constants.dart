import 'package:flutter/material.dart';

extension MyThemeBuilder on BuildContext {
  MyColors? get myColors => Theme.of(this).extension<MyColors>();
}

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.priority,
    required this.separator,
    required this.overlay,
    required this.labelPrimary,
    required this.labelSecondary,
    required this.tertiary,
    required this.disable,
    required this.red,
    required this.green,
    required this.blue,
    required this.gray,
    required this.grayLight,
    required this.white,
    required this.backPrimary,
    required this.backSecondary,
    required this.elevated,
  });

  final Color priority;
  final Color separator;
  final Color overlay;
  final Color labelPrimary;
  final Color labelSecondary;
  final Color tertiary;
  final Color disable;
  final Color red;
  final Color green;
  final Color blue;
  final Color gray;
  final Color grayLight;
  final Color white;
  final Color backPrimary;
  final Color backSecondary;
  final Color elevated;

  @override
  MyColors copyWith() {
    return this;
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    return this;
  }
}

abstract class MyTheme {
  static ThemeData lightData([String? color]) => ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          MyColors(
            priority: Color(int.parse(color ?? '0xFFFF3B30')),
            separator: const Color(0x33000000),
            overlay: const Color(0x0F000000),
            labelPrimary: const Color(0xFF000000),
            labelSecondary: const Color(0x99000000),
            tertiary: const Color(0x4D000000),
            disable: const Color(0x26000000),
            red: const Color(0xFFFF3B30),
            green: const Color(0xFF34C759),
            blue: const Color(0xFF007AFF),
            gray: const Color(0xFF8E8E93),
            grayLight: const Color(0xFFD1D1D6),
            white: const Color(0xFFFFFFFF),
            backPrimary: const Color(0xFFF7F6F2),
            backSecondary: const Color(0xFFFFFFFF),
            elevated: const Color(0xFFFFFFFF),
          ),
        ],
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF007AFF), // header background color
          onPrimary: Color(0xFFFFFFFF), // header text color
          onSurface: Color(0xFF000000), // body text color
        ),
        splashColor: const Color(0x4D000000), //tertiary
        //textTheme: myTextTheme.apply(fontFamily: 'Roboto'),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          foregroundColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFF007AFF), //blue
        ),
      );

  static ThemeData darkData([String? color]) => ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          MyColors(
            priority: Color(int.parse(color ?? '0xFFFF453A')),
            separator: const Color(0x33FFFFFF),
            overlay: const Color(0x52000000),
            labelPrimary: const Color(0xFFFFFFFF),
            labelSecondary: const Color(0x99FFFFFF),
            tertiary: const Color(0x66FFFFFF),
            disable: const Color(0x26FFFFFF),
            red: const Color(0xFFFF453A),
            green: const Color(0xFF32D74B),
            blue: const Color(0xFF0A84FF),
            gray: const Color(0xFF8E8E93),
            grayLight: const Color(0xFF48484A),
            white: const Color(0xFFFFFFFF),
            backPrimary: const Color(0xFF161618),
            backSecondary: const Color(0xFF252528),
            elevated: const Color(0xFF3C3C3F),
          ),
        ],
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0A84FF), // header background color
          onPrimary: Color(0xFFFFFFFF), // header text color
          onSurface: Color(0xFFFFFFFF), // body text color
        ),
        splashColor: const Color(0x66FFFFFF), //tertiary
        dialogBackgroundColor: const Color(0xFF252528), // backSecondary
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: const Color(0xFF252528)),
        ), //backSecondary
        //textTheme: myTextTheme.apply(fontFamily: 'Roboto'),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          foregroundColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFF0A84FF), //blue
        ),
      );

  static TextTheme myTextTheme = const TextTheme(
    displayLarge:
        TextStyle(fontSize: 32, height: 1.1875, fontWeight: FontWeight.w500),
    displayMedium:
        TextStyle(fontSize: 20, height: 1.6, fontWeight: FontWeight.w500),
    labelLarge:
        TextStyle(fontSize: 14, height: 1.714, fontWeight: FontWeight.w500),
    titleMedium:
        TextStyle(fontSize: 16, height: 1.25, fontWeight: FontWeight.w400),
    displaySmall:
        TextStyle(fontSize: 14, height: 1.429, fontWeight: FontWeight.w400),
  );
}

/*
ThemeData myLightTheme = ThemeData.light().copyWith(
  //extensions: ,
  splashColor: const Color(0x4D000000),
  colorScheme: const ColorScheme.light(
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
  textTheme: myTextTheme.apply(fontFamily: 'Roboto'),
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    backgroundColor: const Color(0xFF007AFF),
  ),
);

ThemeData myDarkTheme = ThemeData.dark().copyWith(
  splashColor: const Color(0x66FFFFFF),
  dialogBackgroundColor: const Color(0xFF252528),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          // color of button's letters
          backgroundColor: const Color(0xFF252528))),
  colorScheme: const ColorScheme.dark(
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
      onSurface: Color(0xFFFFFFFF)),
  textTheme: myTextTheme.apply(fontFamily: 'Roboto'),
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    backgroundColor: const Color(0xFF007AFF),
  ),
);
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
