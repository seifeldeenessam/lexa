import 'package:flutter/material.dart';
import 'package:lexa/theme/constants.dart';

ColorScheme lightThemeColorScheme() {
  return ColorScheme.light(
    brightness: Brightness.dark,
    background: LightThemeColors().background,
    onBackground: LightThemeColors().onBackground,
    primary: LightThemeColors().primary,
    secondary: LightThemeColors().secondary,
    tertiary: LightThemeColors().tertiary,
  );
}

ColorScheme darkThemeColorScheme() {
  return ColorScheme.dark(
    brightness: Brightness.light,
    background: DarkThemeColors().background,
    onBackground: DarkThemeColors().onBackground,
    primary: DarkThemeColors().primary,
    secondary: DarkThemeColors().secondary,
    tertiary: DarkThemeColors().tertiary,
  );
}
