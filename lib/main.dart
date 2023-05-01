import 'package:lexa/themes/theme.dart';
import 'package:lexa/utilities/routes_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      MaterialApp(
        initialRoute: '/intoduction',
        routes: routesHandler,
        theme: lightThemeData(),
        darkTheme: darkThemeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  });
}
