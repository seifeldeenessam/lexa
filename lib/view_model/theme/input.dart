import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/text.dart';

InputDecorationTheme lightInputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    isDense: true,
    fillColor: LightThemeColors().onBackground,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
    // Text styles
    hintStyle: lightTextTheme().labelSmall?.copyWith(color: LightThemeColors().tertiary),
    errorStyle: lightTextTheme().labelSmall?.copyWith(color: GlobalColors().error),
    // Borders
    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
  );
}

InputDecorationTheme darkInputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    isDense: true,
    fillColor: DarkThemeColors().onBackground,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
    // Text styles
    hintStyle: lightTextTheme().labelSmall?.copyWith(color: DarkThemeColors().tertiary),
    errorStyle: lightTextTheme().labelSmall?.copyWith(color: GlobalColors().error),
    // Borders
    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
  );
}
