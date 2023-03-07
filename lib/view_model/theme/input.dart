import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/text.dart';

InputDecorationTheme inputDecorationThemeData() {
  return InputDecorationTheme(
    filled: true,
    isDense: true,
    fillColor: colorOnBackground,
    errorMaxLines: 1,
    contentPadding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
    // Text styles
    hintStyle: textThemeData().labelSmall?.copyWith(color: colorTertiary),
    errorStyle: textThemeData().labelSmall?.copyWith(color: colorRed),
    // Borders
    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(borderRadius)),
    errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(borderRadius)),
    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(borderRadius)),
    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(borderRadius)),
  );
}
