import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/constants.dart';

TextButtonThemeData textButtonThemeData() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      disabledBackgroundColor: colorTertiary,
      disabledForegroundColor: colorOnBackground,
      disabledIconColor: colorOnBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(mainUnit / 2)),
      iconColor: colorPrimary,
      foregroundColor: colorPrimary,
    ),
  );
}
