import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context) {
  return showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2100));
}
