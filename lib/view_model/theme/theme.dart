import 'package:lexa/view_model/theme/app_bar.dart';
import 'package:lexa/view_model/theme/button_theme.dart';
import 'package:lexa/view_model/theme/color_scheme.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/theme/input.dart';
import 'package:lexa/view_model/theme/page_transition.dart';
import 'package:lexa/view_model/theme/text.dart';
import 'package:lexa/view_model/theme/text_button_theme.dart';
import 'package:lexa/view_model/theme/floating_action_button_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: LightThemeColors().background,
    textTheme: lightTextTheme(),
    appBarTheme: lightAppBarTheme(),
    pageTransitionsTheme: pageTransitionsTheme(),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    inputDecorationTheme: lightInputDecorationTheme(),
    elevatedButtonTheme: buttonThemeData(),
    textButtonTheme: lightTextButtonThemeData(),
    floatingActionButtonTheme: lightFloatingActionButtonThemeData(),
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
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    inputDecorationTheme: darkInputDecorationTheme(),
    elevatedButtonTheme: buttonThemeData(),
    textButtonTheme: darkTextButtonThemeData(),
    floatingActionButtonTheme: darkFloatingActionButtonThemeData(),
    colorScheme: darkThemeColorScheme(),
  );
}
