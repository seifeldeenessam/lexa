import 'package:lexa/theme/constants.dart';
import 'package:flutter/material.dart';

void showModal(dynamic context, String title, Widget body) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.hardEdge,
    barrierColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.25),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Units().borderRadius),
        topRight: Radius.circular(Units().borderRadius),
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.background,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Wrap(
          runSpacing: Units().spacing,
          alignment: WrapAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            body,
          ],
        ),
      );
    },
  );
}
