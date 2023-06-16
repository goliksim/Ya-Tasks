import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';

import '../../domain/entities/task_entitiy.dart';
import 'fade_animation.dart';
import '../../domain/entities/inherited_wrapper.dart';

const double _expandedHeight = 132.0;
const double _toolbarHeight = 56.0;

double calculateExpandRatio(
  BoxConstraints constraints,
) {
  double expandRation = (constraints.maxHeight - _toolbarHeight) /
      (_expandedHeight - _toolbarHeight);
  if (expandRation > 1) expandRation = 1.0;
  if (expandRation < 0) expandRation = 0.0;
  return expandRation;
}

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({super.key, required this.allDone});
  final int allDone;

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    //bool viewDone = Info.of(context)!.viewDone;
    return SliverAppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        pinned: true,
        //elevation: 0,
        snap: false,
        floating: true,
        expandedHeight: 160.0,
        flexibleSpace: LayoutBuilder(
          builder: (context, constraints) {
            final expandRation = calculateExpandRatio(constraints);
            final animation = AlwaysStoppedAnimation(expandRation);
            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 60.0, right: 60.0, bottom: 16.0),
                      child: FadeAnimation(
                        animation: animation,
                        isExpandedWidget: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Мои дела',
                                style: myTextTheme.headline1!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)),
                            const SizedBox(
                              height: 6,
                            ),
                            Text('Выполнено — ${widget.allDone} ',
                                style: myTextTheme.subtitle1!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                          ],
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: _toolbarHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FadeAnimation(
                              animation: animation,
                              isExpandedWidget: false,
                              child: Text('Мои дела',
                                  style: myTextTheme.headline2!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground))),
                          IconButton(
                              splashRadius: 24.0,
                              onPressed: () {
                                setState(() {
                                  InheritedWrapper.of(context).viewDone =
                                      !InheritedWrapper.of(context).viewDone;
                                  InheritedWrapper.of(context).callBack();
                                  //MyInheritedWidget.of(context).viewDone
                                });
                              },
                              icon: Icon(
                                  InheritedWrapper.of(context).viewDone
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).colorScheme.primary))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
