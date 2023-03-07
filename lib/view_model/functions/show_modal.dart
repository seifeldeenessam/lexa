import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

void showModal(dynamic context, String title, Widget body) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.hardEdge,
    barrierColor: colorTertiary.withOpacity(0.25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
    ),
    backgroundColor: colorBackground,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(mainUnit),
        child: Wrap(
          runSpacing: mainUnit,
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
