import 'dart:convert';
import 'package:flutter/services.dart';

Future getDataFromJSON(String path) async {
  final String url = await rootBundle.loadString(path);
  final dynamic response = await jsonDecode(url);
  return response;
}
