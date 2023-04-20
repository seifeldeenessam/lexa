import 'package:lexa/models/database.dart';
import 'package:lexa/utilities/sort_transactions_by_date.dart';
import 'package:lexa/views/widgets/empty_message.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> loadData() async {
      late List<Map<String, dynamic>> transactions;
      final SQLite localStorage = SQLite();
      await localStorage.read("transactions").then((value) => transactions = value);
      return transactions;
    }

    return FutureBuilder(
      future: loadData(),
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