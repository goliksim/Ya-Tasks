import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../common/animations/fade_animation.dart';
import '../../task/bloc/tasks_bloc.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({super.key});
  final double _expandedHeight = 132.0;
  final double _toolbarHeight = 56.0;

  double calculateExpandRatio(
    BoxConstraints constraints,
  ) {
    double expandRation = (constraints.maxHeight - _toolbarHeight) /
        (_expandedHeight - _toolbarHeight);
    if (expandRation > 1) expandRation = 1.0;
    if (expandRation < 0) expandRation = 0.0;
    return expandRation;
  }

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return SliverAppBar(
          backgroundColor: context.myColors!.backPrimary,
          pinned: true,
          snap: false,
          floating: true,
          expandedHeight: 160.0,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final expandRation = widget.calculateExpandRatio(constraints);
              final animation = AlwaysStoppedAnimation(expandRation);
              return Stack(
                children: [
                  //InitialText
                  FadeAnimation(
                    animation: animation,
                    isExpandedWidget: true,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(
                          left: 60.0, right: 60.0, bottom: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).title,
                            style: MyTheme.myTextTheme.headline1!.copyWith(
                              color: context.myColors!.labelPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${AppLocalizations.of(context).tasksCompletedCount} ${state.myTasks.where((e) => e.done).length}',
                            style: MyTheme.myTextTheme.subtitle1!.copyWith(
                              color: context.myColors!.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //ScrolledText
                  FadeAnimation(
                    animation: animation,
                    isExpandedWidget: false,
                    child: Align(
                      //Stack Align
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        alignment: Alignment.centerLeft, //Align in container
                        height: widget._toolbarHeight,
                        child: Text(
                          AppLocalizations.of(context).title,
                          style: MyTheme.myTextTheme.headline2!.copyWith(
                            color: context.myColors!.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //ViewButton
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 24, 16),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          tooltip: AppLocalizations.of(context).filterButton,
                          padding: EdgeInsets.zero,
                          splashRadius: 24.0,
                          onPressed: () async {
                            context.read<TasksBloc>().add(const DoneFilter());
                          },
                          icon: Icon(
                            state.hideDone
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: context.myColors!.blue,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
