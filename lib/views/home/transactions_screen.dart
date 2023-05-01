import 'package:flutter/material.dart';
import 'package:lexa/viewmodels/home.dart';
import 'package:lexa/widgets/empty_message.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyMessage(illustartion: Transactions().emptyMessage["illustration"], message: Transactions().emptyMessage["message"]);
  }
}
