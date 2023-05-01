import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';

ColorScheme lightThemeColorScheme() {
  return ColorScheme.light(
    brightness: Brightness.dark,
    background: LightThemeColors().background,
    onBackground: LightThemeColors().onBackground,
    primary: LightThemeColors().primary,
  );
}

ColorScheme darkThemeColorScheme() {
  return ColorScheme.dark(
    brightness: Brightness.light,
    background: DarkThemeColors().background,
    onBackground: DarkThemeColors().onBackground,
    primary: DarkThemeColors().primary,
  );
}
