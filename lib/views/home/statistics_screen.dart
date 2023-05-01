import 'package:flutter/material.dart';
import 'package:lexa/viewmodels/home.dart';
import 'package:lexa/widgets/empty_message.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyMessage(illustartion: Statistics().emptyMessage["illustration"], message: Statistics().emptyMessage["message"]);
  }
}
