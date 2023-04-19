import 'package:flutter/material.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  // final LocalDatabase _localStorage = LocalDatabase();
  // List<Map<String, dynamic>> _accounts = [];

  // void _loadData() async {
  //   final data = await _localStorage.read("accounts");
  //   setState(() => _accounts = data);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _loadData();
  // }

  @override
  Widget build(BuildContext context) {
    // String getNetWorth() {
    //   num netWorth = 0.0;
    //   for (var value in _accounts) {
    //     netWorth += value["value"];
    //   }
    //   return "${netWorth.toString()} E£";
    // }

    // List<String> getAccountsValues() {
    //   List<String> accountsValues = [];
    //   _accounts.asMap().values.forEach((value) => accountsValues.add("${value["title"]} • ${value["value"]} E£"));

    //   return accountsValues;
    // }

    return Scaffold(
      body: Center(child: Text("Balance Screen", style: Theme.of(context).textTheme.titleLarge)),
    );
  }
}
