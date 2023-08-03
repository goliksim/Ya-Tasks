import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditorTextField extends StatelessWidget {
  const EditorTextField(
      {super.key, required this.controller, required this.condition});

  final TextEditingController controller;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return responsiveTextField(
      //resizeToAvoidBottomInset: condition ? false: true,
      //extendBody: true,
      condition: condition,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        decoration: BoxDecoration(
            color: context.myColors!.backSecondary,
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle: MyTheme.myTextTheme.titleMedium!
                  .copyWith(color: context.myColors!.tertiary),
              hintText: AppLocalizations.of(context).editorHintText,
              border: InputBorder.none,
            ),
            minLines: condition ? 3 : 100,
            maxLines: condition ? 9 : 100,
            style: MyTheme.myTextTheme.titleMedium!
                .copyWith(color: context.myColors!.labelPrimary),
            textAlignVertical: TextAlignVertical.bottom,
          ),
        ),
      ),
    );
  }
}

Widget responsiveTextField({required Widget child, required bool condition}) {
  if (!condition) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: child,
      //extendBody: true
    );
  } else {
    return child;
  }
}
