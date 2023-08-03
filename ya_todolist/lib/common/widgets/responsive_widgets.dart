import 'package:flutter/cupertino.dart';

class TabletPadding extends StatelessWidget {
  const TabletPadding(
      {super.key, required this.condition, required this.child});
  final bool condition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: condition ? 36 : 0, horizontal: condition ? 18 : 0),
      child: child,
    );
  }
}

class EditorResponsiveBuilder extends StatelessWidget {
  const EditorResponsiveBuilder(
      {super.key, required this.condition, required this.children});
  final bool condition;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, children: children),
      );
    } else {
      return Row(
          verticalDirection: VerticalDirection.down,
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children.reversed
              .map((e) => Expanded(
                    child: e,
                  ))
              .toList());
    }
  }
}
