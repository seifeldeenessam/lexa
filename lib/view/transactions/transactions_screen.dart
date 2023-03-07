import 'package:lexa/view_model/functions/sort_transactions_by_date.dart';
import 'package:lexa/view_model/models/transactions/transactions_screen_view_model.dart';
import 'package:lexa/view_model/widgets/empty_message.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TransactionsScreenViewModel().loadData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const EmptyMessage(message: "Error getting transactions data", illustartion: "transactions");
        } else {
          if (snapshot.data!.isEmpty) {
            return const EmptyMessage(message: "All transactions will be here", illustartion: "transactions");
          } else {
            return SingleChildScrollView(physics: const BouncingScrollPhysics(), child: sortTransactionsByDate(snapshot.data, context));
          }
        }
      },
    );
  }
}

// CircularProgressIndicator(color: colorBlackPrimary, strokeWidth: 2.0),