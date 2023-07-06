import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditorTextField extends StatelessWidget {
  const EditorTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.myColors!.backSecondary,
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintStyle: MyTheme.myTextTheme.subtitle1!
                .copyWith(color: context.myColors!.tertiary),
            hintText: AppLocalizations.of(context).editorHintText,
            border: InputBorder.none,
          ),
          minLines: 3,
          maxLines: 7,
          style: MyTheme.myTextTheme.subtitle1!
              .copyWith(color: context.myColors!.labelPrimary),
          textAlignVertical: TextAlignVertical.bottom,
        ),
      ),
    );
  }
}
