import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData buttonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      alignment: Alignment.center,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
    ),
  );
}
