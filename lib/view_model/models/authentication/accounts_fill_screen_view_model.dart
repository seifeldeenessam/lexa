import 'package:lexa/model/database/local_database.dart';
import 'package:lexa/view_model/functions/get_data_from_json.dart';
import 'package:lexa/view_model/functions/show_snackbar.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class AccountsFillScreenViewModel {
  String title = AppTexts().accountValuesScreenTitle;
  String subTitle = AppTexts().accountValuesScreenSubTitle;
  String paragraph = AppTexts().accountValuesScreenParagraph;

  Future<List<Map>> getCurrenciesList() async {
    Map<String, dynamic> currencies = {};
    List<Map> currenciesList = [];
    await getDataFromJSON('assets/data/currencies.json').then((value) => currencies = value);
    currencies.forEach((key, value) => currenciesList.add(value));
    return currenciesList;
  }

  void submit(BuildContext context, GlobalKey<FormState> formkey, Map<String, dynamic> accountValues) async {
    final LocalDatabase localStorage = LocalDatabase();
    List<Map<String, dynamic>> value = await localStorage.read("accounts");

    if (context.mounted) {
      if (value.isNotEmpty) Navigator.pushNamed(context, '/navigator');
      if (formkey.currentState!.validate()) setAccountsValues(context, accountValues, localStorage);
    }
  }
}

void setAccountsValues(BuildContext context, Map<String, dynamic> accountValues, LocalDatabase localStorage) async {
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
