import 'package:lexa/models/database.dart';
import 'package:lexa/utilities/app_texts.dart';
import 'package:lexa/utilities/get_data_from_json.dart';
import 'package:lexa/utilities/show_snackbar.dart';
import 'package:lexa/views/widgets/guiding_paragraph.dart';
import 'package:lexa/utilities/constants.dart';
import 'package:lexa/validators/banks_account_validator.dart';
import 'package:lexa/validators/cash_account_validator.dart';
import 'package:lexa/validators/savings_account_validator.dart';
import 'package:lexa/views/widgets/app_bar.dart';
import 'package:lexa/utilities/show_modal.dart';
import 'package:lexa/views/widgets/button.dart';
import 'package:lexa/views/widgets/inputs/text.dart';
import 'package:flutter/material.dart';

class AccountsFillScreen extends StatefulWidget {
  const AccountsFillScreen({super.key});

  @override
  State<AccountsFillScreen> createState() => _AccountsFillScreenState();
}

class _AccountsFillScreenState extends State<AccountsFillScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _accountValues = {"cash": null, "banks": null, "savings": null, "cashCurrency": "EGP", "banksCurrency": "EGP", "savingsCurrency": "EGP"};

  void _cashChange(value) => setState(() => _accountValues["cash"] = num.parse(value));
  void _banksChange(value) => setState(() => _accountValues["banks"] = num.parse(value));
  void _savingsChange(value) => setState(() => _accountValues["savings"] = num.parse(value));
  void _cashCurrencyChange(value) => setState(() => _accountValues["cashCurrency"] = value);
  void _banksCurrencyChange(value) => setState(() => _accountValues["banksCurrency"] = value);
  void _savingsCurrencyChange(value) => setState(() => _accountValues["savingsCurrency"] = value);

  Future<List<Map>> _getCurrenciesList() async {
    Map<String, dynamic> currencies = {};
    List<Map> currenciesList = [];
    await getDataFromJSON('assets/data/currencies.json').then((value) => currencies = value);
    currencies.forEach((key, value) => currenciesList.add(value));
    return currenciesList;
  }

  void _setAccountsValues(BuildContext context, Map<String, dynamic> accountValues, SQLite localStorage) async {
    Map<String, dynamic> json = {
      'cash': accountValues["cash"],
      'banks': accountValues["banks"],
      'savings': accountValues["savings"],
      'cashCurrency': accountValues["cashCurrency"],
      'banksCurrency': accountValues["banksCurrency"],
      'savingsCurrency': accountValues["savingsCurrency"],
    };

    await localStorage.insertAccountsValues(json).then((_) {
      showSnackBar(context, true, "Accounts are successfully set");
      Future.delayed(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/navigator'));
    });
  }

  void _submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> accountValues) async {
    final SQLite localStorage = SQLite();
    List<Map<String, dynamic>> value = await localStorage.read("accounts");

    if (context.mounted) {
      if (value.isNotEmpty) Navigator.pushNamed(context, '/navigator');
      if (formkey.currentState!.validate()) _setAccountsValues(context, accountValues, localStorage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: AppTexts().accountValuesScreenTitle)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          children: [
            Expanded(child: GuidingParagragh(subTitle: AppTexts().accountValuesScreenSubTitle, paragraph: AppTexts().accountValuesScreenParagraph)),
            FutureBuilder(
              future: _getCurrenciesList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Form(
                    key: _formKey,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        TextInputWidget(
                          label: "Cash",
                          onChange: _cashChange,
                          validator: cashAccountValidator,
                          keyboardType: "number",
                          suffix: GestureDetector(
                            onTap: () => showModal(context, "Choose currency", ModalBody(onChange: _cashCurrencyChange, currenciesList: snapshot.data)),
                            child: Text(_accountValues["cashCurrency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                          ),
                        ),
                        SizedBox(height: Units().spacing / 2),
                        TextInputWidget(
                          label: "Banks",
                          onChange: _banksChange,
                          validator: banksAccountValidator,
                          keyboardType: "number",
                          suffix: GestureDetector(
                            onTap: () => showModal(context, "Choose currency", ModalBody(onChange: _banksCurrencyChange, currenciesList: snapshot.data)),
                            child: Text(_accountValues["banksCurrency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                          ),
                        ),
                        SizedBox(height: Units().spacing / 2),
                        TextInputWidget(
                          label: "Savings",
                          onChange: _savingsChange,
                          validator: savingsAccountValidator,
                          keyboardType: "number",
                          suffix: GestureDetector(
                            onTap: () => showModal(context, "Choose currency", ModalBody(onChange: _savingsCurrencyChange, currenciesList: snapshot.data)),
                            child: Text(_accountValues["savingsCurrency"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                          ),
                        ),
                        SizedBox(height: Units().spacing),
                        ButtonWidget(action: () => _submit(context, _formKey, _accountValues), label: "Continue"),
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class ModalBody extends StatelessWidget {
  final List<Map>? currenciesList;
  final Function(String) onChange;

  const ModalBody({super.key, required this.currenciesList, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: currenciesList!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onChange(currenciesList![index]["code"]);
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(Units().spacing / 2),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
              child: Row(
                children: [
                  Expanded(child: Text(currenciesList![index]["name"], style: Theme.of(context).textTheme.bodyMedium)),
                  SizedBox(width: Units().spacing / 2),
                  Text(currenciesList![index]["code"], style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: Units().spacing / 2),
      ),
    );
  }
}
