import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

appBarTheme() {
  return AppBarTheme(
    elevation: 0,
    titleSpacing: 0,
    backgroundColor: colorBackground,
    titleTextStyle: textThemeData().titleLarge,
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar theme
      statusBarBrightness: Brightness.dark, // IOS
      statusBarIconBrightness: Brightness.light, // Android
      // Navigation bar theme
      systemNavigationBarColor: colorBackground,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
