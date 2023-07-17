import 'package:flutter/cupertino.dart';

Widget tabletPadding({required bool condition, required Widget child}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: condition ? 36 : 0, horizontal: condition ? 18 : 0),
      child: child,
    );
