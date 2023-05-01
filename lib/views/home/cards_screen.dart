import 'package:flutter/material.dart';
import 'package:lexa/viewmodels/home.dart';
import 'package:lexa/widgets/empty_message.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyMessage(illustartion: Cards().emptyMessage["illustration"], message: Cards().emptyMessage["message"]);
  }
}
