import 'package:flutter/material.dart';
import 'package:lexa/theme/constants.dart';

TextButtonThemeData lightTextButtonThemeData() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      disabledBackgroundColor: LightThemeColors().tertiary,
      disabledForegroundColor: LightThemeColors().onBackground,
      disabledIconColor: LightThemeColors().onBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Units().spacing / 2)),
      iconColor: LightThemeColors().primary,
      foregroundColor: LightThemeColors().primary,
    ),
  );
}

TextButtonThemeData darkTextButtonThemeData() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      disabledBackgroundColor: DarkThemeColors().tertiary,
      disabledForegroundColor: DarkThemeColors().onBackground,
      disabledIconColor: DarkThemeColors().onBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Units().spacing / 2)),
      iconColor: DarkThemeColors().primary,
      foregroundColor: DarkThemeColors().primary,
    ),
  );
}
