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

  void submit(BuildContext context, Map<String, dynamic> accountValues) async {
    final LocalDatabase localStorage = LocalDatabase();

    await localStorage.read("accounts").then((value) async {
      if (value.isEmpty) {
        if (accountValues["cash"] == null || accountValues["banks"] == null || accountValues["savings"] == null) {
          showSnackBar(context, false, "Fill all fields");
        }

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
      } else {
        Navigator.pushNamed(context, '/navigator');
      }
    });
  }
}
