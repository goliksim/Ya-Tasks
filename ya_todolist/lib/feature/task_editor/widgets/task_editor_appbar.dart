import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditorAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppbar({required this.saveTask, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final void Function(BuildContext) saveTask;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Text(AppLocalizations.of(context).save,
                textAlign: TextAlign.center, style: myTextTheme.button),
            onPressed: () {
              saveTask(context);
            },
          ),
        ),
      ],
      leading: IconButton(
        tooltip: AppLocalizations.of(context).closeButton,
        splashRadius: 24,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
