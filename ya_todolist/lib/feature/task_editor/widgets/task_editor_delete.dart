import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/common/theme_constants.dart';

class EditorDeleteButton extends StatelessWidget {
  const EditorDeleteButton(
      {super.key, required this.editMode, required this.deleteTask});
  final bool editMode;
  final void Function(BuildContext) deleteTask;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor:
            (editMode) ? context.myColors!.red : context.myColors!.tertiary,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {
        deleteTask;
      },
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.delete,
                color: (editMode)
                    ? context.myColors!.red
                    : context.myColors!.tertiary,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                AppLocalizations.of(context).delete,
                style: MyTheme.myTextTheme.titleMedium!.copyWith(
                  color: (editMode)
                      ? context.myColors!.red
                      : context.myColors!.tertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
