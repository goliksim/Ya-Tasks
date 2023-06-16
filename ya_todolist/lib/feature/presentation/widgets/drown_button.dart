import 'package:flutter/material.dart';
import 'package:ya_todolist/common/theme_constants.dart';

Widget myDropDownWindget(
        BuildContext context, String? dropdownvalue, updatePriority) =>
    DropdownButtonFormField(
      value: dropdownvalue,
      hint: const Text('Нет'),
      dropdownColor: Theme.of(context).colorScheme.onSurfaceVariant,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:
              // цвет линнии в окне
              BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        hintStyle: myTextTheme.subtitle1!
            .copyWith(color: Theme.of(context).colorScheme.tertiary),
        //hintText: 'Нет',
        label: Text(
          'Важность',
          style: myTextTheme.subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      icon: const Icon(null),
      onChanged: (value) {
        updatePriority(value);
      },
      items: drownButtonList(context),
    );

List<DropdownMenuItem> drownButtonList(BuildContext context) {
  return [
    DropdownMenuItem<String>(
        value: 'Нет',
        child: Text(
          'Нет',
          style: myTextTheme.subtitle1!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        )),
    DropdownMenuItem<String>(
      value: 'Низкая',
      child: Text(
        'Низкая',
        style: myTextTheme.subtitle1!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'Высокая',
      child: Text(
        'Высокая',
        style: myTextTheme.subtitle1!
            .copyWith(color: Theme.of(context).colorScheme.error),
      ),
    )
  ];
}
