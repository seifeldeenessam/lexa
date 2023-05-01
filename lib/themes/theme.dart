import 'package:lexa/themes/app_bar.dart';
import 'package:lexa/themes/color_scheme.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/themes/input.dart';
import 'package:lexa/themes/page_transition.dart';
import 'package:lexa/themes/text.dart';
import 'package:lexa/themes/text_button_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: LightThemeColors().background,
    textTheme: lightTextTheme(),
    appBarTheme: lightAppBarTheme(),
    pageTransitionsTheme: pageTransitionsTheme(),
    splashFactory: NoSplash.splashFactory,
    inputDecorationTheme: lightInputDecorationTheme(),
    textButtonTheme: lightTextButtonThemeData(),
    colorScheme: lightThemeColorScheme(),
  );
}

ThemeData darkThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: DarkThemeColors().background,
    textTheme: darkTextTheme(),
    appBarTheme: darkAppBarTheme(),
    pageTransitionsTheme: pageTransitionsTheme(),
    splashFactory: NoSplash.splashFactory,
    inputDecorationTheme: darkInputDecorationTheme(),
    textButtonTheme: darkTextButtonThemeData(),
    colorScheme: darkThemeColorScheme(),
  );
}
