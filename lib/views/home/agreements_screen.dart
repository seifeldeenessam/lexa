import 'package:flutter/material.dart';
import 'package:lexa/viewmodels/home.dart';
import 'package:lexa/widgets/empty_message.dart';

class AgreementsScreen extends StatelessWidget {
  const AgreementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyMessage(illustartion: Agreements().emptyMessage["illustration"], message: Agreements().emptyMessage["message"]);
  }
}
