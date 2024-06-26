import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';

TextButtonThemeData lightTextButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      disabledBackgroundColor: GlobalColors().grey,
      disabledForegroundColor: LightThemeColors().onBackground,
      disabledIconColor: LightThemeColors().onBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Units().spacing * 2)),
      iconColor: LightThemeColors().primary,
      foregroundColor: LightThemeColors().primary,
      splashFactory: NoSplash.splashFactory,
    ),
  );
}

TextButtonThemeData darkTextButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      disabledBackgroundColor: GlobalColors().grey,
      disabledForegroundColor: DarkThemeColors().onBackground,
      disabledIconColor: DarkThemeColors().onBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Units().spacing * 2)),
      iconColor: DarkThemeColors().primary,
      foregroundColor: DarkThemeColors().primary,
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
