import 'package:flutter/material.dart';

enum Picker { date, time }

Future showPicker(BuildContext context, Picker pricker) {
  if (pricker == Picker.date) return showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2100));
  return showTimePicker(context: context, initialTime: TimeOfDay.now());
}
