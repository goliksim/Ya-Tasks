import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ya_todolist/common/theme_constants.dart';

abstract class Dialogs {
  const Dialogs._();

  static Future<bool?> showConfirmCloseCountDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      routeSettings: const RouteSettings(
        name: '/alert_confirm_delete_todo',
      ),
      barrierDismissible: false,
      builder: (BuildContext context) => const ConfirmCloseCountDialog(),
    );
  }
}

class ConfirmCloseCountDialog extends StatelessWidget {
  const ConfirmCloseCountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //elevation: 2,
      backgroundColor: context.myColors!.backPrimary,
      title: Text(
        AppLocalizations.of(context).confirmTitle,
        style: MyTheme.myTextTheme.displayMedium,
      ),
      content: Text(
        AppLocalizations.of(context).confirmText,
        style: MyTheme.myTextTheme.titleMedium,
      ),
      actions: [
        SimpleDialogOption(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            AppLocalizations.of(context).confirmYes,
            style: MyTheme.myTextTheme.labelLarge!
                .copyWith(color: context.myColors!.red),
          ),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            AppLocalizations.of(context).confirmNo,
            style: MyTheme.myTextTheme.labelLarge!
                .copyWith(color: context.myColors!.tertiary),
          ),
        ),
      ],
    );
  }
}
