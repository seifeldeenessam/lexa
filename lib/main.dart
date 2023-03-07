import 'package:lexa/view_model/theme/theme.dart';
import 'package:lexa/view_model/utilities/routes_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      MaterialApp(
        initialRoute: '/',
        routes: routesHandler,
        theme: themeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  });
}
