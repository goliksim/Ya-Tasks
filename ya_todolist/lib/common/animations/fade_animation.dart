import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final bool isExpandedWidget;

  const FadeAnimation(
      {super.key,
      required this.animation,
      required this.child,
      required this.isExpandedWidget});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: Tween(
                begin: isExpandedWidget ? 0.0 : 1.0,
                end: isExpandedWidget ? 1.0 : 0.0)
            .animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(
                isExpandedWidget ? 0.35 : 0.1, isExpandedWidget ? 1.0 : 0.35),
          ),
        ),
        child: child);
  }
}

Route simpleSlidePageRoute(Widget child) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 650),
    reverseTransitionDuration: const Duration(milliseconds: 900),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
