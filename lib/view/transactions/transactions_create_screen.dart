import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/functions/format_date.dart';
import 'package:lexa/view_model/models/transactions/transactions_create_screen_view_model.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/widgets/inputs/date.dart';
import 'package:lexa/view_model/widgets/inputs/dropdown.dart';
import 'package:lexa/view_model/widgets/inputs/text.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransactionsCreateScreen extends StatefulWidget {
  const TransactionsCreateScreen({super.key});

  @override
  State<TransactionsCreateScreen> createState() => _TransactionsCreateScreenState();
}

class _TransactionsCreateScreenState extends State<TransactionsCreateScreen> {
  final Map<String, dynamic> _transactionData = {
    "type": TransactionsCreateScreenViewModel().transactionTypes[0],
    "title": null,
    "price": null,
    "note": null,
    "category": null,
    "account": null,
    "occurrenceDate": null,
    "expiryDate": null,
  };

  void _typeChange(value) => setState(() => _transactionData["type"] = value);
  void _titleChange(value) => setState(() => _transactionData["title"] = value);
  void _priceChange(value) => setState(() => _transactionData["price"] = num.parse(value));
  void _noteChange(value) => setState(() => _transactionData["note"] = value);
  void _categoryChange(value) => setState(() => _transactionData["category"] = value);
  void _billingAccountChange(value) => setState(() => _transactionData["account"] = value);
  void _occurrenceDateChange(value) => setState(() => _transactionData["occurrenceDate"] = value);
  void _expiryDateChange(value) => setState(() => _transactionData["expiryDate"] = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: TransactionsCreateScreenViewModel().title,
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
                  DropdownInputWidget(label: "Transaction type", items: TransactionsCreateScreenViewModel().transactionTypes, onChange: _typeChange),
                  SizedBox(height: Units().spacing / 2),
                  FutureBuilder(
                    future: TransactionsCreateScreenViewModel().getAccounts(),
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
                            DropdownInputWidget(label: "Category *", items: TransactionsCreateScreenViewModel().transactionCategories, required: false, onChange: _categoryChange),
                            SizedBox(height: Units().spacing / 2),
                            DropdownInputWidget(label: "Account *", items: snapshot.data, required: false, onChange: _billingAccountChange),
                            SizedBox(height: Units().spacing / 2),
                            DateInputWidget(onChange: _occurrenceDateChange, label: formateDate(_transactionData["occurrenceDate"] ?? DateTime.now())),
                            if (_transactionData["type"] == "Subscription") SizedBox(height: Units().spacing / 2),
                            if (_transactionData["type"] == "Subscription") DateInputWidget(onChange: _expiryDateChange, label: formateDate(_transactionData["expiryDate"] ?? DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day, DateTime.now().hour, DateTime.now().minute))),
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
            ButtonWidget(action: () => TransactionsCreateScreenViewModel().submit(context, _transactionData), label: "Submit"),
          ],
        ),
      ),
    );
  }
}
