import 'package:lexa/view_model/theme/app_bar.dart';
import 'package:lexa/view_model/theme/button_theme.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/theme/input.dart';
import 'package:lexa/view_model/theme/page_transition.dart';
import 'package:lexa/view_model/theme/text.dart';
import 'package:lexa/view_model/theme/text_button_theme.dart';
import 'package:lexa/view_model/theme/floating_action_button_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: colorBackground,
    textTheme: textThemeData(),
    appBarTheme: appBarTheme(),
    pageTransitionsTheme: pageTransitionsTheme(),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    inputDecorationTheme: inputDecorationThemeData(),
    elevatedButtonTheme: buttonThemeData(),
    textButtonTheme: textButtonThemeData(),
    floatingActionButtonTheme: floatingActionButtonThemeData(),
  );
}
