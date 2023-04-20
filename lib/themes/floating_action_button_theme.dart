import 'package:flutter/material.dart';
import 'package:lexa/utilities/constants.dart';

FloatingActionButtonThemeData lightFloatingActionButtonThemeData() {
  return FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: LightThemeColors().primary,
  );
}

FloatingActionButtonThemeData darkFloatingActionButtonThemeData() {
  return FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: DarkThemeColors().primary,
  );
}
