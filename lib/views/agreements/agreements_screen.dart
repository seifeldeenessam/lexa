import 'package:lexa/widgets/empty_message.dart';
import 'package:flutter/material.dart';

class AgreementsScreen extends StatefulWidget {
  const AgreementsScreen({super.key});

  @override
  State<AgreementsScreen> createState() => _AgreementsScreenState();
}

class _AgreementsScreenState extends State<AgreementsScreen> {
  @override
  Widget build(BuildContext context) {
    return const EmptyMessage(message: "All agreements will be here", illustartion: "agreements");
  }
}
