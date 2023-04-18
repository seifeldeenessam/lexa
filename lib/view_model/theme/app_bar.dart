import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme lightAppBarTheme() {
  return AppBarTheme(
    elevation: 0,
    titleSpacing: 0,
    backgroundColor: LightThemeColors().onBackground,
    titleTextStyle: lightTextTheme().titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar theme
      statusBarBrightness: Brightness.dark, // IOS
      statusBarIconBrightness: Brightness.light, // Android
      // Navigation bar theme
      systemNavigationBarColor: LightThemeColors().background,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

AppBarTheme darkAppBarTheme() {
  return AppBarTheme(
    elevation: 0,
    titleSpacing: 0,
    backgroundColor: DarkThemeColors().onBackground,
    titleTextStyle: darkTextTheme().titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar theme
      statusBarBrightness: Brightness.dark, // IOS
      statusBarIconBrightness: Brightness.light, // Android
      // Navigation bar theme
      systemNavigationBarColor: DarkThemeColors().background,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
