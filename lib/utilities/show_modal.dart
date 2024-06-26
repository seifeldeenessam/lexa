import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';

void showModal(dynamic context, String title, Widget body) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.hardEdge,
    barrierColor: GlobalColors().grey.withOpacity(0.25),
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
