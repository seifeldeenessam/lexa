import 'package:lexa/model/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:lexa/model/database/local_database.dart';
import 'package:lexa/view_model/functions/show_snackbar.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';

class TransactionsCreateScreenViewModel {
  String title = AppTexts().transactionsCreateScreenTitle;

  final List<String> transactionTypes = ["Payment", "Subscription"];
  final List<String> transactionCategories = ["Food", "Shopping", "Transportation", "Vehicle", "Communication", "Utilities", "Lifestyle", "Investments", "Revenues", "Other"];

  Future<List<String>> getAccounts() async {
    final LocalDatabase localStorage = LocalDatabase();
    List<String> accounts = [];

    List<Map<String, Object?>> databaseAccounts = await localStorage.read("accounts");
    for (var account in databaseAccounts) {
      accounts.add(account["title"].toString());
    }

    return accounts;
  }

  Future<num> getCurrentBalace(String queryAccount) async {
    final LocalDatabase localStorage = LocalDatabase();
    num currentBalance = 0.0;

    List<Map<String, Object?>> databaseAccounts = await localStorage.read("accounts");
    for (var account in databaseAccounts) {
      if (account["title"].toString() == queryAccount) {
        currentBalance += num.parse(account["value"].toString());
      }
    }

    return currentBalance;
  }

  void submit(BuildContext context, Map<String, dynamic> transactionData) async {
    if (transactionData["type"] == null || transactionData["title"] == null || transactionData["price"] == null || transactionData["category"] == null || transactionData["account"] == null || transactionData["occurrenceDate"] == null || transactionData["expiryDate"] == null) {
      showSnackBar(context, false, "Fill required all fields");
    }

    final LocalDatabase localStorage = LocalDatabase();
    num currentBalance = await getCurrentBalace(transactionData["account"]);

    Map<String, Object?> transaction = TransactionModel(
      type: transactionData["type"],
      title: transactionData["title"],
      price: transactionData["price"],
      note: transactionData["note"],
      category: transactionData["category"],
      billingAccount: transactionData["account"],
      currentBalance: currentBalance,
      occurrenceDate: transactionData["occurrenceDate"],
      expiryDate: transactionData["expiryDate"],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).toJSON();

    await localStorage.create('transactions', transaction).then((value) => showSnackBar(context, true, "Transaction is successfully created"));
  }

  void delete(int id, BuildContext context) async {
    final LocalDatabase localStorage = LocalDatabase();

    await localStorage.delete('transactions', id).then((value) {
      Navigator.pop(context);
      showSnackBar(context, true, "Transaction is successfully deleted");
    });
  }
}

  // void _occurrenceDateChange() async {
  //   final pickedDate = await pickDate(context);
  //   if (pickedDate == null) {
  //     return;
  //   } else {
  //     final pickedTime = await pickTime(context);
  //     if (pickedTime == null) {
  //       setState(() => _occurrenceDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day));
  //     } else {
  //       setState(() => _occurrenceDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute));
  //     }
  //   }
  // }

  // void _expiryDateChange() async {
  //   final pickedDate = await pickDate(context);
  //   if (pickedDate == null) {
  //     return;
  //   } else {
  //     final pickedTime = await pickTime(context);
  //     if (pickedTime == null) {
  //       setState(() => _expiryDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day));
  //     } else {
  //       setState(() => _expiryDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute));
  //     }
  //   }
  // }