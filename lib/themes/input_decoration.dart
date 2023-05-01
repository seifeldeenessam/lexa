import 'package:lexa/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/themes/text.dart';

InputDecorationTheme lightInputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    isDense: true,
    fillColor: LightThemeColors().onBackground,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
    hintStyle: lightTextTheme().labelMedium?.copyWith(color: GlobalColors().grey),
    errorStyle: lightTextTheme().labelSmall?.copyWith(color: GlobalColors().red),
    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
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
    hintStyle: lightTextTheme().labelMedium?.copyWith(color: GlobalColors().grey),
    errorStyle: lightTextTheme().labelSmall?.copyWith(color: GlobalColors().red),
    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(Units().borderRadius)),
  );
}
