import 'package:flutter/material.dart';

Future<TimeOfDay?> pickTime(BuildContext context) {
  return showTimePicker(context: context, initialTime: TimeOfDay.now());
}
