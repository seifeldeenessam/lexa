import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

showSnackBar(dynamic context, bool status, String message) {
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: status == true ? colorGreen : colorRed,
    padding: const EdgeInsets.symmetric(horizontal: mainUnit, vertical: mainUnit - 8),
    content: Text(message, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
