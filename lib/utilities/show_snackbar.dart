import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';

showSnackBar(dynamic context, bool status, String message) {
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: status == true ? GlobalColors().green : GlobalColors().red,
    padding: EdgeInsets.symmetric(horizontal: Units().spacing, vertical: Units().spacing - 8),
    content: Text(message, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
