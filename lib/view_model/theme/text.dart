import 'package:flutter/material.dart';
import 'package:lexa/view_model/theme/constants.dart';

TextTheme textThemeData() {
  return const TextTheme(
    // Body text theme
    bodySmall: TextStyle(fontFamily: "ReadexPro", fontSize: 10, fontWeight: FontWeight.w400, color: colorPrimary, letterSpacing: 0),
    bodyMedium: TextStyle(fontFamily: "ReadexPro", fontSize: 16, fontWeight: FontWeight.w400, color: colorPrimary, letterSpacing: 0),
    bodyLarge: TextStyle(fontFamily: "ReadexPro", fontSize: 20, fontWeight: FontWeight.w400, color: colorPrimary, letterSpacing: 0),
    // Labels text theme
    labelSmall: TextStyle(fontFamily: "ReadexPro", fontSize: 14, fontWeight: FontWeight.w500, color: colorPrimary, letterSpacing: 0),
    labelMedium: TextStyle(fontFamily: "ReadexPro", fontSize: 16, fontWeight: FontWeight.w500, color: colorPrimary, letterSpacing: 0),
    labelLarge: TextStyle(fontFamily: "ReadexPro", fontSize: 20, fontWeight: FontWeight.w500, color: colorPrimary, letterSpacing: 0),
    // Titles text theme
    titleSmall: TextStyle(fontFamily: "ReadexPro", fontSize: 16, fontWeight: FontWeight.w600, color: colorPrimary, letterSpacing: 0),
    titleMedium: TextStyle(fontFamily: "ReadexPro", fontSize: 20, fontWeight: FontWeight.w600, color: colorPrimary, letterSpacing: 0),
    titleLarge: TextStyle(fontFamily: "ReadexPro", fontSize: 24, fontWeight: FontWeight.w600, color: colorPrimary, letterSpacing: 0),
  );
}
