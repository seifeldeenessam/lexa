import 'package:lexa/models/database.dart';
import 'package:lexa/models/transaction.dart';
import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/utilities/show_snackbar.dart';
import 'package:lexa/utilities/string_extentions.dart';
import 'package:lexa/views/widgets/app_bar.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/utilities/format_date.dart';
import 'package:lexa/views/widgets/button.dart';
import 'package:lexa/views/widgets/inputs/date.dart';
import 'package:lexa/views/widgets/inputs/dropdown.dart';
import 'package:lexa/views/widgets/inputs/text.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransactionsCreateScreen extends StatefulWidget {
  const TransactionsCreateScreen({super.key});

  @override
  State<TransactionsCreateScreen> createState() => _TransactionsCreateScreenState();
}

class _TransactionsCreateScreenState extends State<TransactionsCreateScreen> {
  final List<String> _types = ["Payment", "Subscription"];
  final List<String> _categories = ["Food", "Shopping", "Transportation", "Vehicle", "Communication", "Utilities", "Lifestyle", "Investments", "Revenues", "Other"];
  late Map<String, dynamic> _data;

  void _typeChange(value) => setState(() => _data["type"] = value);
  void _titleChange(value) => setState(() => _data["title"] = value);
  void _priceChange(value) => setState(() => _data["price"] = num.parse(value));
  void _noteChange(value) => setState(() => _data["note"] = value);
  void _categoryChange(value) => setState(() => _data["category"] = value);
  void _billingAccountChange(value) => setState(() => _data["account"] = value);
  void _occurrenceDateChange(value) => setState(() => _data["occurrenceDate"] = value);
  void _expiryDateChange(value) => setState(() => _data["expiryDate"] = value);

  Future<List<String>> _getAccounts() async {
    final SQLite localStorage = SQLite();
    List<String> accounts = [];
    List<Map<String, Object?>> databaseAccounts = await localStorage.read("accounts");
    for (var account in databaseAccounts) {
      accounts.add(account["title"].toString());
    }
    return accounts;
  }

  Future<num> _getCurrentBalace(String queryAccount) async {
    final SQLite localStorage = SQLite();
    num currentBalance = 0.0;
    List<Map<String, Object?>> databaseAccounts = await localStorage.read("accounts");
    for (var account in databaseAccounts) {
      if (account["title"].toString() == queryAccount) {
        currentBalance += num.parse(account["value"].toString());
      }
    }
    return currentBalance;
  }

  dynamic _submit(BuildContext context, Map<String, dynamic> transactionData) async {
    for (var entry in _data.entries) {
      if (entry.value == null) return showSnackBar(context, false, "${entry.key.capitalize()} is required");
    }

    final SQLite localStorage = SQLite();
    num currentBalance = await _getCurrentBalace(transactionData["account"]);

    Map<String, Object?> transaction = Transaction(
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

  @override
  void initState() {
    super.initState();
    _data = {
      "type": _types[0],
      "title": null,
      "price": null,
      "note": null,
      "category": null,
      "account": null,
      "occurrenceDate": null,
      "expiryDate": null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: AppTexts().transactionsCreateScreenTitle,
          actions: [
            ButtonWidget(action: () => Navigator.pushNamed(context, '/transfer/create'), icon: PhosphorIcons.light.swap, backgroundColor: Colors.transparent, type: ButtonTypes.primary),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  DropdownInputWidget(label: "Transaction type", items: _types, onChange: _typeChange),
                  SizedBox(height: Units().spacing / 2),
                  FutureBuilder(
                    future: _getAccounts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            TextInputWidget(label: "Title *", onChange: _titleChange),
                            SizedBox(height: Units().spacing / 2),
                            TextInputWidget(label: "Price *", onChange: _priceChange, keyboardType: "number"),
                            SizedBox(height: Units().spacing / 2),
                            TextInputWidget(label: "Note", onChange: _noteChange, paragraph: true),
                            SizedBox(height: Units().spacing / 2),
                            DropdownInputWidget(label: "Category *", items: _categories, required: false, onChange: _categoryChange),
                            SizedBox(height: Units().spacing / 2),
                            DropdownInputWidget(label: "Account *", items: snapshot.data, required: false, onChange: _billingAccountChange),
                            SizedBox(height: Units().spacing / 2),
                            DateInputWidget(onChange: _occurrenceDateChange, label: formateDate(_data["occurrenceDate"] ?? DateTime.now())),
                            if (_data["type"] == "Subscription") SizedBox(height: Units().spacing / 2),
                            if (_data["type"] == "Subscription") DateInputWidget(onChange: _expiryDateChange, label: formateDate(_data["expiryDate"] ?? DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day, DateTime.now().hour, DateTime.now().minute))),
                          ],
                        );
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(Units().spacing / 2),
                          decoration: BoxDecoration(color: GlobalColors().error, borderRadius: BorderRadius.circular(Units().spacing / 2)),
                          child: Text("Error rendering inputs", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: Units().spacing),
            ButtonWidget(action: () => _submit(context, _data), label: "Submit"),
          ],
        ),
      ),
    );
  }
}
